#!/usr/bin/env ruby
##
# Deploy.rb
#
# Deploy dotfiles into users $HOME via symlinks
# Useful for those who keep a version controlled (via git) folder
# full of dotfiles
#
# notes: 
#   does not symlink bin/
#   does not symlink .git or .gitignore (for obvious reasons)
##

require 'optparse'

def parse_opts

    options = {}
    options[:verbose] = false
    options[:overwrite] = false

    OptionParser.new do |opts|
        opts.banner = "Usage: deploy.rb [options]"

        opts.on("-v", "--verbose", "Run verbosely") do |v|
            options[:verbose] = v

        end
        opts.on("-o", "--overwrite", "Overwrite previously found dotfiles") do |o|
            options[:overwrite] = o
        end
    end.parse!

    return options
end

def main

    options = parse_opts


    home = File.expand_path("~")
    dotfiles_dir = File.join(home, "dotfiles")
    
    Dir.foreach(dotfiles_dir) { |x| 

        # where the original file resides
        from = File.join(dotfiles_dir, x)

        if not (x == "." or x == ".." or x == ".git" or x == ".gitignore")

            # where to symlink will belong 
            if x != "bin"
                to = File.join(home, "."+x)
            else
                to = File.join(home, x)
            end

            if File.exists?(to)

                if options[:overwrite]
                    if File.directory?(to)
                        Dir.delete(to)
                    else
                        File.delete(to)
                    end
                    puts "Deleting: #{to}" if options[:verbose]
                else
                    File.rename(to, to+".bak")
                    puts "Backing up: #{to} ==> #{to}.bak" if options[:verbose]
                end

            end
            # the meat:
            if not File.exists?(to)
                puts "#{from} ==> #{to}" if options[:verbose]
                File.symlink(from, to)
            end

        end

    }

end

if __FILE__ == $0

    main

end

