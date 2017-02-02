local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
-- {{{ Variable definitions

-- path to awesome config dir
awesome_home = awful.util.getdir("config")

-- override vars from selected theme
theme=beautiful.get()
theme.awesome_icon     = awesome_home .. "/icons/arch16.png"
theme.bat              = awesome_home .. "/icons/bat.png"
theme.lowbat           = awesome_home .. "/icons/lowbat.png"
theme.wifi             = awesome_home .. "/icons/wifi.png"
theme.vol              = awesome_home .. "/icons/spkr.png"
theme.mem              = awesome_home .. "/icons/mem.png"
theme.disc             = awesome_home .. "/icons/disc.png"
theme.cpu              = awesome_home .. "/icons/cpu.png"

theme.font          = "Terminus 8"
theme.border_width  = 0
theme.tasklist_disable_icon = true

--default applications for the menu
terminal    = "xfce4-terminal"
editor      = "vim"

-- path to xdg_menu generation file
-- xdg_menu creates a applications menu for you
gen_xdg_menu_file = "/etc/xdg/menus/arch-applications.menu"

-- Screenshot directory
screenshot_dir = os.getenv("HOME") .. "/Screenshots/"
screenshot_cmd = "import -frame "
function screenshot_dest()
    return screenshot_dir .. os.time() .. ".png"
end

-- Default modkey.
modkey = "Mod4"
-- }}}

-- Volume widget: file that stores acpi-volume informations (ibm thinkpads)
volfile = "/proc/acpi/ibm/volume"
--volfile = false --disables volume widget

-- battery to show
mybattery_target="BAT0"


-- {{{ Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
    awful.layout.suit.corner.nw
}

-- }}}

-- {{{ Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
menubar.cache_entries = true -- caching the icons
menubar.app_folders = { "/usr/share/applications/" }
menubar.show_categories = false 
-- }}}
