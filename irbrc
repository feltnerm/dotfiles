require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:USE_READLINE] = true
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

begin
    require 'rubygems'
    require 'ap'
    require 'wirble'

    Wirble.init
    Wirble.colorize
end

