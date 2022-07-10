import os
import subprocess
from libqtile import qtile
from libqtile.command import lazy

from libqtile.bar import Bar

from libqtile import widget
from libqtile.lazy import lazy

from colors import gruvbox

bar = Bar([
      widget.GenPollText( # Keyboard layout
           update_interval=1,
           fontsize = 20,
           func=lambda: subprocess.check_output(os.path.expanduser("sb-layout")).decode("utf-8"),
           foreground = "#ffffff",
           background=gruvbox['bg'],
           padding = 4
          ),
      widget.TextBox(
               text = '|',
               foreground = "#ffffff",
               background = gruvbox['bg'],
               padding = 1,
               fontsize = 14
               ),
    #widget.TextBox(
    #    text='',
    #    foreground='#3490bb',
    #    fontsize=20,
    #    mouse_callbacks={"Button1": lazy.group['scratchpad'].dropdown_toggle('term')},
    #),
    widget.GroupBox(
        disable_drag=True,
        active = ["#f1c232", "#3f7eee"],
        inactive='#6e6e6e',
        highlight_method='line',
        block_highlight_text_color= ["#3f7eee", "#f1c232"],
        highlight_color=gruvbox['bg'],
        background=gruvbox['bg'],
        fontsize=15,
        margin_y = 3,
        margin_x = 0,
        padding_y = 5,
        padding_x = 3,
        borderwidth = 2,
        this_current_screen_border = ["#eeeeee"],
        this_screen_border = ["#ff5555"],
        other_current_screen_border = ["#4f76c7"],
        other_screen_border = ["#ff5555"],

    ),
    widget.Spacer(
        length=1,
    ),
    widget.CurrentLayoutIcon( # icons windows layout
        custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
        background = gruvbox['bg'],
        padding = 0,
        scale = 0.7
    ),
    #widget.CurrentLayout(
    #    background=gruvbox['dark-yellow'],
    #    padding=1,
    #    fontsize=16,
    #),
    widget.WindowCount(
        text_format=' {num}',
        background=gruvbox['magenta'],
        fontsize=12,
        show_zero=True,
    ),

    widget.WindowName(
            fmt = '{} ',
        foreground='#ffffff',
        fontsize=14,
    ),
    widget.Clock(
        format='%Y.%m.%d %a -= %H:%M =-',
        padding = 0,
        background=gruvbox['bg'],
        foreground=gruvbox['blue'],
        font='Source Code Pro:style=Bold Italic',
        fontsize = 18
        ),
    widget.Spacer(length=250, background=gruvbox['bg']),
    widget.TextBox(
              text='',
              font = 'FiraCode Nerd Font',
              background = "#ff6c6b",
              foreground = "#98be65",
              padding = 0,
              fontsize = 37
              ),
     widget.CheckUpdates(
              update_interval = 1800,
              distro = "Arch_checkupdates",
              display_format = "Updates: {updates} ",
              foreground = "#282c34",
              colour_have_updates = "#282c34",
              colour_no_updates = "#282c34",
              mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('alacritty -e sudo pacman -Syu')},
              padding = 5,
              background = "#98be65"
              ),
    widget.GenPollText( # VOLUME
        background = "#982392",
        foreground = "#f0ff0f",
        func=lambda: subprocess.check_output(
            os.path.expanduser("sb-volume")).decode("utf-8"),
         update_interval = 0.1,
         fontsize = 16,
         padding = 5,
         mouse_callbacks = {
             'Button1': lambda: lazy.spawn('alacritty -e pulsemixer'),
             'Button2': lambda: lazy.spawn('pamixer -t', shell=True),
             #'Button3': lambda: qtile.cmd_spawn(edit_dm_script+"sb-volume", shell=True),
             'Button4': lambda: lazy.spawn('pamixer --allow-boost -i 1'),
             'Button5': lambda: lazy.spawn('pamixer --allow-boost -d 1')
             }),
    widget.GenPollText( # CPU
             update_interval=1,
             background = "#067cb9",
             foreground = "#ffffff",
             func=lambda: subprocess.check_output(
                 os.path.expanduser("sb-cpu")).decode("utf-8"),
             fontsize = 14,
             padding = 5,
             mouse_callbacks = {
                 'Button1': lazy.spawn('alacritty -e htop'),
                 'Button2': lazy.spawn("alacritty -t  -e nvim sb-volume")
                 }),
    widget.GenPollText( # Inet
             update_interval = 0.1,
            background = "#f1c232",
            func=lambda: subprocess.check_output(
                os.path.expanduser("network.sh")).decode("utf-8"),
             fontsize = 16,
             padding = 5,
             mouse_callbacks={
                 'Button1': lazy.spawn('alacritty -t nmtui -e sudo nmtui'),
                 #'Button3' : get_inet_info,
                 'Button2': lazy.spawn("alacritty -t  -e nvim network.sh")
                 }),
    widget.Systray(icon_size=15, background=gruvbox['bg'])
],
    # margin=[0, 10, 5, 10],
    background=gruvbox['bg'],
    opacity=1,
    size=18,
)
