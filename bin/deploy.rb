#!/usr/bin/env ruby
##
# Deploy.rb
#
# Deploy dotfiles into users $HOME via symlinks
# Useful for those who keep a version controlled (via git) folder
# full of dotfiles
#
# assumptions:
#   your files are stored in either ~/dotfiles or ~/dropbox
#   no files start with a '.'
#
# notes: 
#   does not symlink bin/
#   does not symlink .git or .gitignore (for obvious reasons)
#
# issues:
#   if it tries to copy a folder that already exists, it blows up.
#
##

require 'optparse'

def parse_opts

    options = {}
    options[:verbose] = false
    options[:overwrite] = false
    options[:backup] = false
    options[:what_dir] = "dotfiles"

    OptionParser.new do |opts|
        opts.banner = "Usage: deploy.rb [options]"

        opts.on("-v", "--verbose", "Run verbosely") do
            options[:verbose] = true

        end
        opts.on("-o", "--overwrite", "Overwrite previously found files/folders") do
            options[:overwrite] = true 
        end

        opts.on("-b", "--backup", "Backup previously found files/folders")do
            options[:backup] = true 
        end

        opts.on("-w", "--what [DIR]", "What to deploy (dotfiles/dropbox")do |dir|
            options[:what_dir] = dir
        end

        opts.on("-h", "--help", "Display this screen")do
            puts opts
            exit
        end

    end.parse!

    return options
end

def make_link(from, to, options)
    puts ">>>> #{File.basename(from)}" if options[:verbose]
    if File.exists?(to)

        if options[:backup]
            File.rename(to, to+".bak")
            puts "BACKUP: #{to} ==> #{to}.bak" if options[:verbose]
        end

        if options[:overwrite]
            if File.directory?(to)
                Dir.delete(to)
            else
                File.delete(to)
            end
            puts "DELETE: #{to}" if options[:verbose]
        end


    end

    if not File.exists?(to)
        puts "LINK #{from} ==> #{to}" if options[:verbose]
        File.symlink(from, to)
    end
end

def main

    options = parse_opts

    home = File.expand_path("~")
    dir = File.join(home, "dotfiles")

    if options[:what_dir] == "dropbox"
        dir = File.join(home, "Dropbox")
    elsif options[:what_dir] == "dotfiles"
        dir = File.join(home, "dotfiles")
    else
        puts "Error, that deployment is not setup. Maybe you should make it!"
        exit
    end

    puts "##########\nDeploying: #{options[:what_dir]}\n##########"
    Dir.foreach(dir) { |x| 

        # where the original file resides
        from = File.join(dir, x)

        if not x.start_with?(".")

            # where to symlink will belong 
            if options[:what_dir] == "dotfiles"
                if x != "bin"
                    to = File.join(home, "."+x)
                else
                    to = File.join(home, x)
                end
                make_link from, to, options
            elsif options[:what_dir] == "dropbox"
                if !x.start_with?(".")
                    to = File.join(home, x)
                    make_link from, to, options
                end
            end


        end

    }

end

if __FILE__ == $0

    main

end

