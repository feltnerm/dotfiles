#!/usr/bin/env ruby
#
# Script to toggle extended monitor outputs if something is connected
#


DEBUG = false

require 'ruby-debug' if DEBUG
require 'optparse'


## CONTANTS & DEFAULTS ##
#########################

# Dir where user defined (arandr) screenlayouts are kept
SCREENLAYOUTS = File.expand_path("~/.screenlayout") 

# the notebook monitor
DEFAULT_OUTPUT = 'LVDS1'

# other outputs to toggle, if connected
OUTPUTS = ['VGA1', 'HDMI1']

# Get info from xrandr
XRANDR=`xrandr -q`

## SCREEN MODIFYING FUNCTIONS ##
################################
# Run a layout from the default layouts directory
def layout(l)
    
    script = File.join(SCREENLAYOUTS, l+".sh")
    if not File.exists?(script)
        puts "Script #{script} was not found."
    else
        puts "\n>> Layout: #{l}" if VERBOSE
        `sh #{script}`
    end

end

# Set layouts to auto
def default()
    # Arguments for xrandr:
    execute=" --output #{DEFAULT_OUTPUT} --mode 1280x800"

    for output in OUTPUTS

        if /#{output}\ connected* / =~ XRANDR # output IS connected
            execute += " --output #{output} --auto" 
        else
            execute += " --output #{output} --off"
        end
    end

    puts "\n>> Layout: auto" if VERBOSE
    puts "   Options: #{execute}" if VERBOSE
    `xrandr #{execute}`

end
################################

## OPTION PARSER ##
###################
# Options:
#   env => specifies user defined setups found in .screen-settings
options = {
    "layout"=> ""
}
OptionParser.new do |opts|

    opts.on("-l", "--layout [LAYOUT]", 
            "Use a predefined layout located in ~/.screensettings") do |l|
        options["layout"] << l
    end

    opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options[:verbose] = v
    end

    opts.on("-r", "--restore", "Restore wallpaper with nitrogen") do |r|
        options[:restore] = r
    end

end.parse!

## MAIN ##
##########
if options[:verbose] 
    VERBOSE = true
else                 
    VERBOSE = false
end
if options["layout"] != ""
    layout(options["layout"])
else
    default
end

if options[:restore]
    `nitrogen --restore`
end

