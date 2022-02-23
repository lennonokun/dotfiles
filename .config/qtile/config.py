import subprocess
import os
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from libqtile.log_utils import logger
from typing import List  # noqa: F401

mod = "mod4"
terminal = "alacritty"
colors = { # solarized
    "base00":   "#657b83",
    "base01":   "#586e75",
    "base02":   "#073642",
    "base03":   "#002b36",
    "base0":    "#839496",
    "base1":    "#93a1a1",
    "base2":    "#eee8d5",
    "base3":    "#fdf6e3",
    "red":      "#dc322f",
    "orange":   "#cb4b16",
    "yellow":   "#b58900",
    "green":    "#859900",
    "cyan":     "#2aa198",
    "blue":     "#268bd2",
    "violet":   "#6c71c4",
    "magenta":  "#d33682",
}

try:
    keys = [
        # Move and shuffle windows
        Key([mod], "n",
            lazy.layout.up(),
            desc="Move focus up"),
        Key([mod], "e",
            lazy.layout.down(),
            desc="Move focus down"),
        Key([mod, "shift"], "n",
            lazy.layout.shuffle_up(),
            desc="Shuffle window up"),
        Key([mod, "shift"], "e",
            lazy.layout.shuffle_down(),
            desc="Shuffle window down"),

        # Move and shuffle monitor
        Key([mod], "s",
            lazy.to_screen(0),
            desc="Focus monitor 0"),
        Key([mod], "t",
            lazy.to_screen(1),
            desc="Focus monitor 1"),

        # Layout control
        Key([mod], "i",
            lazy.layout.grow(),
            desc="Grow major"),
        Key([mod], "o",
            lazy.layout.shrink(),
            desc="Shrink major"),
        Key([mod], "space",
            lazy.next_layout(),
			desc="Toggle between layouts"),

        # Control
        KeyChord([mod], "z", [
            Key([], "q",
                lazy.spawn("shutdown now"),
                desc="Shutdown"),
            Key([], "r",
                lazy.restart(),
                desc="Restart Qtile"),
            Key([], "l",
                lazy.spawn("dm-tool lock"),
                desc="Lock screen")
        ]),

        # Scripts
        KeyChord([mod], "x", [
            Key([], "b",
                lazy.spawn("./scripts/toggle-buds.sh"),
                desc="Connect/disconnect earbuds"), 
            Key([], "s",
                lazy.spawn("./scripts/screenshot.sh"),
                desc="Take screenshot"),
            Key([], "r",
                lazy.spawn("./scripts/display-mode.sh"),
                desc="Refresh display-mode")
        ]),

        # Misc
        Key([mod], "c",
            lazy.window.kill(),
			desc="Kill focused window"),
        Key([mod], "d", # TODO kinda looks bad on top of bar
            # lazy.spawn("dmenu_run -p 'Run: '"),
            lazy.spawn("wofi --show run"),
			desc="Run launcher"),
        Key([mod], "Return",
            lazy.spawn(terminal),
			desc="Launch terminal"),
    ]
    
    groups = [Group(i) for i in "123456789"]
    group_keys = "qwfpbjluy"
    
    for i, k in zip(groups, group_keys):
        keys.extend([
            # mod1 + group key = switch to group
            Key([mod], k, lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name)),
    
            # mod1 + shift + group key = move focused window to group
            Key([mod, "shift"], k, lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name)),
        ])
    
    layout_theme = {
        "border_width": 2,
        "margin": 10,
        "border_focus": colors["red"],
        "border_normal": colors["cyan"]
    }

    layouts = [ # TODO try more layouts
        layout.xmonad.MonadTall(**layout_theme),
        layout.Max(),
    ]
    
    widget_defaults = dict(
        font="FiraCode-Retina",
        fontsize=14,
        padding=3,
        background=colors["base02"],
        foreground=colors["base1"],
    )
    extension_defaults = widget_defaults.copy()

    def init_widgets():
        return [
            widget.GroupBox(highlight_method="block",
                            this_current_screen_border=colors["red"],
                            this_screen_border=colors["red"],
                            other_current_screen_border=colors["cyan"],
                            other_screen_border=colors["cyan"],
                            hide_unused=True),
            widget.Prompt(),
            widget.Spacer(),
            # widget.Systray(),
            # widget.Sep(padding=6),
            widget.Battery(show_short_text=False,
                           update_interval=5,
                           **widget_defaults), # why necessary?
            widget.Sep(padding=6),
            widget.OpenWeather(location="Hoboken,US", metric=False), 
            widget.Sep(padding=6),
            widget.Clock(format="%m/%d %a %H:%M"),
        ]

    screens = [
        Screen(top=bar.Bar(widgets=init_widgets(), size=24)),
        Screen(top=bar.Bar(widgets=init_widgets(), size=24))
    ]
    
    # Drag floating layouts.
    mouse = [
        Drag([mod], "Button1", lazy.window.set_position_floating(),
             start=lazy.window.get_position()),
        Drag([mod], "Button3", lazy.window.set_size_floating(),
             start=lazy.window.get_size()),
        Click([mod], "Button2", lazy.window.toggle_floating())
    ]

    @hook.subscribe.startup_once
    def autostart():
        home = os.path.expanduser('~')
        subprocess.call([home + '/.config/qtile/autostart.sh'])
    
    dgroups_key_binder = None
    dgroups_app_rules = []  # type: List
    follow_mouse_focus = True
    bring_front_click = False
    floating_layout = layout.Floating(float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
    ])

    auto_fullscreen = True
    focus_on_window_activation = "smart"
    auto_minimize = True
    cursor_warp = True
    reconfigure_screens = True
    wmname = "LG3D"
except Exception as e:
    logger.exception(e)

