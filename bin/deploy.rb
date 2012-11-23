#!/usr/bin/env ruby


def main

    home = File.expand_path("~")
    dotfiles_dir = File.join(home, "dotfiles")
    
    Dir.foreach(dotfiles_dir) { |x| 

        from = File.join(dotfiles_dir, x)

        if not (x == "." or x == ".." or x == ".git" or x == ".gitignore")

            if x != "bin"
                to = File.join(home, "."+x)
            else
                to = File.join(home, x)
            end

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
