require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:USE_READLINE] = true
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# ASCII table views
require 'hirb/import_object'
Hirb.enable
extend Hirb::Console

begin
    require 'rubygems'
    require 'ap'
    require 'wirble'
    Wirble.init
    Wirble.colorize

    require 'net-http-spy'

    require 'bond'
    Bond.start

    require 'what_methods'

    module DynamicPrompt
        def self.apply!
            IRB.conf[:PROMPT][:INFORMATIVE] = {
                :PROMPT_I => ">>".tap {|s| def s.dup; gsub('>>', DynamicPrompt.normal); end },
                :PROMPT_S => "\e[0;35m%n\e[0m   ",
                :PROMPT_C => "\e[0;35m%n\e[0m>   ",
                :RETURN => "\e[1;35m=>\e[0m %.2048s\n"
            }
            IRB.conf[:PROMPT_MODE]  = :INFORMATIVE
        end
    
        def self.normal
            color1 = "\e[0;35m%n \e[35m[\e[1;35m"
            color2 = "\e[0;35m]::\e[1;34m"
            color3 = "\e[0;35m]\e[0m>"
            color1 + current_ruby + color2 + cwd + color3 
        end

        private
        def self.current_ruby
            @@current_ruby ||= `rvm current`.strip
        end

        def self.cwd
            if Dir.pwd == '/'
                '/'
            elsif Dir.pwd == ENV['HOME']
                '~'
            else
                Dir.pwd.split('/').last
            end
        end

    end
DynamicPrompt.apply!
end

