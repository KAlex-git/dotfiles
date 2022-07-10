#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#{{{
import os
import subprocess
from typing import List  # noqa: F401

from libqtile import hook

from libqtile.extension.window_list import WindowList
from libqtile.extension.command_set import CommandSet

# import layout objects
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.stack import Stack
from libqtile.layout.floating import Floating

# import widgets and bar

from libqtile.config import Click, Drag, DropDown, Group, Key, Match, ScratchPad, Screen
from libqtile.lazy import lazy
# from libqtile.utils import guess_term

from colors import gruvbox

from bar_transparent_rounded import bar
#}}}

SUPER = "mod4"
alt = "mod1"
term = "alacritty"
bookmedia = "bookmenu -p '>>' -fn jetbrains mono-10 -s : -b /home/kalex/.config/bookmenu/media -co open"
bookbrowser = "bookmenu -p '>>' -fn jetbrains mono-10 -s : -b /home/kalex/.config/bookmenu/browser -co opera"
bookconfigs = "bookmenu -p '>>' -fn jetbrains mono-10 -s : -b /home/kalex/.config/bookmenu/configs -co 'st -e nvim'"

keys = [


    # Toggle floating and fullscreen
    Key([SUPER], "f", lazy.window.toggle_fullscreen()),
    Key([SUPER, "shift"], "space", lazy.window.toggle_floating()),

    # Keybindings for resizing windows in MonadTall layout
    Key([SUPER], "i", lazy.layout.grow()),
    Key([SUPER], "m", lazy.layout.shrink()),
    Key([SUPER], "n", lazy.layout.normalize()),
    Key([SUPER], "o", lazy.layout.maximize()),
    Key([SUPER, "control"], "space", lazy.layout.flip()),

    # Switch between windows
    Key([SUPER], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([SUPER], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([SUPER], "j", lazy.layout.down(), desc="Move focus down"),
    Key([SUPER], "k", lazy.layout.up(), desc="Move focus up"),

    ### Next/Prev group
    Key([SUPER], "semicolon", lazy.screen.next_group(skip_empty=True), desc="Move to next active group"),
    Key([SUPER], "a", lazy.screen.prev_group(skip_empty=True), desc="Move to previous active group"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([SUPER, "shift"], "h", lazy.layout.shuffle_left(),  desc="Move window to the left"),
    Key([SUPER, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([SUPER, "shift"], "j", lazy.layout.shuffle_down(),  desc="Move window down"),
    Key([SUPER, "shift"], "k", lazy.layout.shuffle_up(),    desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([SUPER, "control"], "h", lazy.layout.grow_left(),   desc="Grow window to the left"),
    Key([SUPER, "control"], "l", lazy.layout.grow_right(),  desc="Grow window to the right"),
    Key([SUPER, "control"], "j", lazy.layout.grow_down(),   desc="Grow window down"),
    Key([SUPER, "control"], "k", lazy.layout.grow_up(),     desc="Grow window up"),
    Key([SUPER], "n", lazy.layout.normalize(),              desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(["shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),

    # Toggle between different layouts as defined below
    Key([SUPER],    "Tab", lazy.next_layout(),      desc="Toggle between layouts"),
    Key([alt],    "q", lazy.window.kill(),        desc='Kill active window'),
    Key([SUPER],      "q", lazy.spawn('kill_window'), desc='killing all this is processes'),
    Key([alt],      "i", lazy.spawn('dmkill'),      desc='fzf killing processes'),

   ## Key([SUPER, "control"], "r", lazy.reload_config(), desc="Reload the config"),
   ## Key([SUPER, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # TODO /* Launch applications */
    Key([SUPER],    "w",            lazy.spawn('opera')),
    Key([SUPER],    "d",            lazy.spawn('dmrun')),
    Key([SUPER],    "r",            lazy.spawn(term+' -e lfub')),
    Key([SUPER],    "Return",       lazy.spawn(term)),
    Key([alt],      "o",            lazy.spawn(bookconfigs)),
    Key([alt],      "b",            lazy.spawn(bookmedia)),
    Key([alt],      "w",            lazy.spawn(bookbrowser)),
    Key([alt],      "BackSpace",    lazy.spawn('dmMenu'), desc='menu reboot, logout, change wm,...'),
    Key([SUPER],    "BackSpace",    lazy.spawn("clearMemory_Update"), desc='Renew Qtile/DWM'),
    Key([alt],      "m",            lazy.spawn('fixsocialweb'), desc='menu ZOOM,Viber,TelegramDesktop...'),
    Key([alt],      "apostrophe",   lazy.spawn("wt -w"), desc="wtlibrary" ),
    Key([alt],      "grave",        lazy.spawn("dmenuunicode"), desc="emoji+dmenu+copy in buffer" ),
    Key([SUPER, alt],      "a",     lazy.spawn("apps_man.sh"), desc="emoji+dmenu+copy in buffer" ),
    Key(['control', alt],      "p", lazy.spawn("passmenu"), desc="fix passmenu [fast]" ),

    ## Mount
    Key([], 'F9', lazy.spawn('dmenumount')),
    Key(['shift'], 'F9', lazy.spawn('dmenuumount')),
    ## Sound
    Key([SUPER],            'p', lazy.spawn('mpc toggle')),
    Key([SUPER],            'm', lazy.spawn(term+ ' -e ncmpcpp')),
    Key([SUPER],            'bracketleft', lazy.spawn('mpc seek -10')),
    Key([SUPER],            'bracketright', lazy.spawn('mpc seek +10')),
    Key([SUPER],            'comma', lazy.spawn('mpc prev')),
    Key([SUPER],            'period', lazy.spawn('mpc next'), desc='sound next'),
    Key([SUPER, 'shift'],   'comma', lazy.spawn('mpc seek 0%')),
    Key([SUPER, 'shift'],   'period', lazy.spawn('mpc repeat')),
    ## Volume
    Key([SUPER], "equal", lazy.spawn('pacontrol.sh up'),            desc='volume up'),
    Key([SUPER], "minus", lazy.spawn('pacontrol.sh down'),          desc='volume down'),
    Key([], "XF86AudioMute", lazy.spawn('pacontrol.sh mute')),
    Key([], "XF86AudioRaiseVolume", lazy.spawn('pacontrol.sh up')),
    Key([], "XF86AudioLowerVolume", lazy.spawn('pacontrol.sh down')),
    ## Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("light -A 10")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("light -U 10")),


]

groups = [
    Group('1', label="", layout="stack"),
    Group('2', label="2", matches=[
          Match(wm_class=["Opera"])
          ], layout="stack"),
    Group('3', label="3", matches=[
          Match(wm_class="teams-for-linux"),
          Match(wm_class=["zoom"])
          ], layout="stack"),
    Group('4', label="4", matches=[
          Match(wm_class=["mytetra", "wtlibrary.exe"])
          ], layout="monadtall"),
    Group('5', label="5", matches=[
        Match(wm_class=["TelegramDesktop", "Viber"])
        ], layout="columns"),
]

for i in groups:
    keys.extend([
        # SUPER1 + letter of group = switch to group
        Key([SUPER], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # Or, use below if you prefer not to switch to that group.
        # SUPER1 + shift + letter of group = move focused window to group
        Key([SUPER, "shift"], i.name, lazy.window.togroup(i.name),
            desc="move focused window to group {}".format(i.name)),
    ])

# Append scratchpad with dropdowns to groups
groups.append(ScratchPad('scratchpad', [
    DropDown('term', 'alacritty',
        width=0.6, height=0.7, x=0.2, y=0.1, opacity=1, on_focus_lost_hide=False),
    DropDown('ncp', term+' -e ncmpcpp',
        width=0.6, height=0.6, x=0.1, y=0.38, opacity=1),
    DropDown('tetra', '~/.config/mytetra/mytetra.run')
]))
# extend keys list with keybinding for scratchpad
keys.extend([
    Key([alt], "Return", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key(["control"], "m", lazy.group['scratchpad'].dropdown_toggle('ncp')),
    Key(["control"], "n", lazy.group['scratchpad'].dropdown_toggle('tetra'))
])

layouts = [
    Stack(
        border_normal=gruvbox['dark-gray'],
        border_focus=gruvbox['blue'],
        # border_width=2,
        num_stacks=1,
        margin=0,
    ),
    MonadTall(
        border_normal=gruvbox['dark-gray'],
        border_focus=gruvbox['yellow'],
        margin=10,
        border_width=2,
        single_border_width=1,
        single_margin=0,
    ),
]

floating_layout = Floating(
    border_normal=gruvbox['dark-gray'],
    border_focus=gruvbox['red'],
    border_width=3,
    float_rules=[
        *Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(wm_class='screengrab'),  # GPG key password entry

        Match(wm_class="Pinentry"),
        Match(wm_class="blueman-manager"),
        Match(wm_class="pavucontrol"),
    ])

# Drag floating layouts.
mouse = [
    Drag([alt], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([alt], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([alt], "Button2", lazy.window.bring_to_front())
]
widget_defaults = dict(
    font='FiraCode Nerd Font',
    fontsize=12,
    padding=2,
    foreground=gruvbox['bg'],
)

extension_defaults = widget_defaults.copy()

screens = [Screen(bottom=bar)]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
# bring_front_click = ''
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "eDP1"


#@hook.subscribe.startup_once
#def autostart():
#    home = os.path.expanduser('~/.config/qtile/autostart.sh')
#    subprocess.run([home])
