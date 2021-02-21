from typing import List  # noqa: F401

import os
import re
import socket
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen, Rule
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
mod1 = "alt"
myTerm = "kitty"
home = os.path.expanduser('~')


def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)


def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)


def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)


keys = [

    # Launch terminal, kill window, restart and exit Qtile

    Key([mod], "Return", lazy.spawn(myTerm)),
    Key([mod], "w", lazy.window.kill()),
    Key([mod], "Escape", lazy.spawn('xkill')),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "q", lazy.shutdown()),

    # Dmenu

    Key([mod], "d", lazy.spawn("dmenu_run")),

    # Custom key bindings

    Key([mod], "x", lazy.spawn("librewolf")),
    Key([mod], "f", lazy.spawn("pcmanfm")),
    Key([mod], "i", lazy.spawn("nitrogen")),
    Key([mod], "p", lazy.spawn('pavucontrol')),

    # Volume keys

    Key([], "XF86AudioMute", lazy.spawn("amixer -D pulse sset Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "amixer -D pulse sset Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "amixer -D pulse sset Master 5%+")),

    # Toggle layouts

    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "space", lazy.next_layout()),
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),

    # Change window focus

    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod, "mod1"], "h", lazy.layout.previous()),  # Stack
    Key([mod, "mod1"], "l", lazy.layout.next()),     # Stack

    # Switch focus to a physical monitor (dual/triple set up)

    Key([mod], "period", lazy.next_screen()),
    Key([mod], "comma", lazy.prev_screen()),
    Key([mod], "a", lazy.to_screen(0)),
    Key([mod], "b", lazy.to_screen(1)),
    Key([mod], "c", lazy.to_screen(2)),

    # Move windows to different physical screens

    Key([mod, "shift"], "comma", lazy.function(window_to_previous_screen)),
    Key([mod, "shift"], "period", lazy.function(window_to_next_screen)),
    Key([mod], "t", lazy.function(switch_screens)),


    # Resize layout

    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),

    # Flip left and right pains and move windows

    Key([mod, "shift"], "f", lazy.layout.flip()),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod], "m", lazy.layout.toggle_maximize()),  # Stack
    Key([mod, "shift"], "Left",
        lazy.layout.swap_left(),
        lazy.layout.client_to_previous()),  # Stack
    Key([mod, "shift"], "Right",
        lazy.layout.swap_right(),
        lazy.layout.client_to_next()),  # Stack

]


groups = []

# Allocate layouts and labels

group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
group_layouts = ["monadtall", "monadtall", "monadtall",
                 "monadtall", "monadtall", "monadtall",
                 "monadtall", "monadtall", "monadtall"]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
        ))

for i in groups:
    keys.extend([

        # Workspace navigation

        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod], "Tab", lazy.screen.next_group()),
        Key([mod, "control"], i.name, lazy.window.togroup(i.name)),
        Key([mod, "shift"], i.name, lazy.window.togroup(
            i.name), lazy.group[i.name].toscreen()),
    ])

layouts = [
    layout.MonadTall(),
    layout.Max(),
    layout.Floating(),
    # layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    layout.Columns(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]


def init_layout_theme():
    return {"margin": 8,
            "border_width": 4,
            "border_focus": "#56b6c2",
            "border_normal": "#e06c75"
            }


layout_theme = init_layout_theme()


layouts = [
    layout.MonadTall(**layout_theme),
    layout.Floating(**layout_theme),
    layout.Max(**layout_theme)
]


widget_defaults = dict(
    font='IBM Plex Mono Medium',
    fontsize=16,
    padding=4,
    background="#282a2e",
    foreground="#abb2bf",
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    foreground="#e06c75",
                ),

                widget.GroupBox(
                    highlight_method="line",
                    this_current_screen_border="#61afef",
                    this_screen_border="#61afef",
                    other_current_screen_border="#e5c07b"
                ),

                widget.Prompt(),

                widget.WindowName(foreground="#56b6c2"),

                widget.CPU(
                    foreground="#61afef",
                    format='CPU {load_percent}%',
                ),

                widget.Memory(foreground="#c678dd"),

                widget.Net(
                    foreground="#e06c75",
                    format='{down} ↓↑ {up}',
                ),

                widget.Volume(foreground="#e5c07b"),

                widget.Clock(format='%d-%m-%Y %a %H:%M',
                             foreground="#98c379",
                             ),
                widget.Systray(),

            ],
            24,
        ),
    ),
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    foreground="#e06c75",
                ),

                widget.GroupBox(
                    highlight_method="line",
                    this_current_screen_border="#61afef",
                    this_screen_border="#61afef",
                    other_current_screen_border="#e5c07b"
                ),

                widget.Prompt(),

                widget.WindowName(foreground="#56b6c2"),

                widget.CPU(
                    foreground="#61afef",
                    format='CPU {load_percent}%',
                ),

                widget.Memory(foreground="#c678dd"),

                widget.Net(
                    foreground="#e06c75",
                    format='{down} ↓↑ {up}',
                ),

                widget.Volume(foreground="#e5c07b"),

                widget.Clock(format='%d-%m-%Y %a %H:%M',
                             foreground="#98c379",
                             ),
                widget.Systray(),

            ],
            24,
        ),
    ),

]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
