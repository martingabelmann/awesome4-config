local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- generate menu with xdg_menu
xdgmenu_file= awesome_home .. "/xdgmenu.lua"
if awful.util.file_readable(gen_xdg_menu_file) then
    awful.spawn.with_shell("xdg_menu --format awesome --root-menu " .. gen_xdg_menu_file .. " > " .. xdgmenu_file)
end
if type(awful.util.checkfile(xdgmenu_file)) == "function" then
    xf = io.open(xdgmenu_file, "r")
    awful.util.eval(xf:read("*all"))
    xf:close()
else
    xdgmenu = nil
end

-- confirm <question> to run <func> by clicking on the notification
function askfor(question, func) 
	naughty.notify({
        title   = question,
        text    = "click for 'yes'",
        timeout = 5,
        run     = func
	})
end

-- write theme name to awesome_home/themeswitch
-- and restart awesome
function write_theme(theme_dir)
    f=io.open(awesome_home .. "/themeswitch", "w")
    f:write(theme_dir)
    f:close()
    awful.util.eval(awesome.restart)
end

-- search for all themes in awesome_home/themes
themeswitch = {}
for theme_dir in io.popen('ls -1 ' .. awesome_home .. "/themes"):lines() do --using popen here is fine since it is only called at startup
    if awful.util.file_readable(awesome_home .. "/themes/" .. theme_dir .. "/theme.lua") then
	    table.insert(themeswitch, { theme_dir,  function() write_theme(theme_dir) end })
    end
end

mymainmenu = awful.menu({ 
    items = { 
        { "logout", function() askfor("Do you really want to logout?",  awesome.quit) end},
        
        { "poweroff", function() askfor(
            "Do you really want to shutdown?",  
            function() awful.spawn(terminal .. " -x systemctl poweroff -i") end
            ) 
            end 
        },

        { "reboot", function() askfor(
            "Do you really want to reboot?",  
            function() awful.spawn(terminal .. " -x systemctl reboot -i") end
            ) 
            end 
        },

        { "standby", function() askfor(
            "Do you really want to suspend?",  
            function() awful.spawn(terminal .. " -x systemctl suspend") end
            ) 
            end 
        },
        
        { "lock screen", terminal .. " -x slock" },       
        { "theme switch", themeswitch },
        { "awesome", xdgmenu, theme.awesome_icon }
    }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
