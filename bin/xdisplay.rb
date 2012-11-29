#!/usr/bin/env ruby
#
# Script to toggle extended monitor outputs if something is connected
#


DEBUG = false

require 'ruby-debug' if DEBUG
require 'optparse'


options = {
    "env"=> "home"
}
OptionParser.new do |opts|

end

# the notebook monitor
DEFAULT_OUTPUT = 'LVDS1'

# other outputs to toggle, if connected
OUTPUTS = ['VGA1', 'HDMI1']

# Get info from xrandr
XRANDR=`xrandr -q`
execute=" --output #{DEFAULT_OUTPUT} --mode 1280x800"

for output in OUTPUTS

    if /#{output}\ connected* / =~ XRANDR # output IS connected
            execute += " --output #{output} --auto" 
    else
        execute += " --output #{output} --off"
    end
end

puts "xrandr #{execute}"
`xrandr #{execute}`

#for line in XRANDR.each
#    
#    if / connected / =~ line
#        if line.start_with? DEFAULT_OUTPUT
#            EXECUTE += "--output #{DEFAULT_OUTPUT} --mode 1280x800 --pos 0x400 --rotate normal"
#        end
#    end
#end
