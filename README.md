See also my [awesome-powerline theme](https://github.com/martingabelmann/awesome-powerline).  

# AwesomeWM
AwesomeWM config (4+) and -widgets.  
This is a "wrapper" around [awesome-copycats](https://github.com/copycat-killer/awesome-copycats). It uses copycats themes but modifies the wibar on its own (such that one has exactly the same features in all themes). Switching between themes is as easy as two clicks.

### Variables
Configuration variables are set in the `config.lua`. In principle it is possible to configure everything there without hassle with the `rc.lua`.

### Theme switch
There are a lot of awesome themes, changing the theme path by hand to see how they look/feel is rather annoying...
When cloning this repo with `--recursive` you get a [lot of themes](https://github.com/copycat-killer/awesome-copycats) and you are able to change/try them with the awesome menu.  
The name of the used theme is saved in the file `~/config/awesome"/themeswitch`, you can change it with the menu (which also restarts awesome) or set it by hand.

### Screenshots
are saved to `~/Screenshots`. By default `import -frame DATE` (from imagemagick package) is used.  
Shortkey is `Print`. 

### XDG menu
On Archlinux install `pacman -S archlinux-xdg-menu`. It then generates an Application menu on every awesome start (saved in xdgmenu.lua).
Other distros may change the `gen_xdg_menu_file=/etc/xdg/menus/arch-applications.menu` path. 
For more information see the archlinux [xdg-menu wiki article](https://wiki.archlinux.org/index.php/xdg-menu).

### Shutdown dialog
Using the shutdown/logout/suspend/reboot buttons from the awesome menu spawns a naugthy notification. To confirm the command left-click on the notification, otherwise it will vanish afert 5 seconds.
