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

def main

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

            # the meat:
            if not File.exists?(to) and not File.symlink?(to)
                puts "#{from} ==> #{to}"
                File.symlink(from, to)
            end

        end

    }

end

if __FILE__ == $0

    main

end

