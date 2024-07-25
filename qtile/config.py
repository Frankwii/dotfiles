# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
from libqtile import bar, layout, widget,hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration

mod = "mod4"              # Sets mod key to SUPER/WINDOWS
shift = "shift"           # Shift
ctrl = "control"          # Ctrl
alt = "mod1"              # Alt
enter = "Return"          # Enter
tab="Tab"                 # Tab
printscreen="Print"       # Print Screen button
myTerm = "alacritty"      # My terminal of choice
myBrowser = "firefox"     # My browser of choice

# A function for hide/show all the windows in a group
@lazy.function
def minimize_all(qtile):
    for win in qtile.current_group.windows:
        if hasattr(win, "toggle_minimize"):
            win.toggle_minimize()
            

# @lazy.function 
def command_run(qtile,command):
    os.system(command)

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows:
    #
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, shift], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, shift], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, shift], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, shift], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, ctrl], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, ctrl], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, ctrl], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, ctrl], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, shift], "m", minimize_all(), desc="Toggle hide/show all windows on current group"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes


    # CUSTOM FRANK
    # System keybinds 
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("pamixer -i 5"),
        desc="Raise volume by 5%"
        ),
    Key([],"XF86AudioLowerVolume",lazy.spawn("pamixer -d 5"),desc="Lower volume by 5%"),
    Key([],"XF86AudioMute",lazy.spawn("pamixer -t"),desc="Toggle mute"),
    Key([],"XF86MonBrightnessUp",lazy.spawn("light -A 5"),desc="Raise brightness by 5%"),
    Key([],"XF86MonBrightnessDown",lazy.spawn("light -U 5"),desc="Lower brightness by 5%"),
    # Screenshots
    Key([alt],printscreen,lazy.spawn("screenshot"),desc="Dmenu screenshot"),
    Key([],printscreen,lazy.spawn("screenshot Full"),desc="Copy to clipboard fullscreen screenshot"),
    Key([shift],printscreen,lazy.spawn("screenshot Selection"),desc="Copy to clipboard selection screenshot"),
    Key([ctrl],printscreen,lazy.spawn("screenshot Save\ full"),desc="Save fullscreen screenshot"),
    Key([ctrl,shift],printscreen,lazy.spawn("screenshot Save\ selection"),desc="Save selection screenshot"),

    # Shortcuts
    Key([mod],"r",lazy.spawn("dmenu_run"),desc="Run dmenu"),
    Key([mod],"c",lazy.spawn("code"),desc="Run vscode"),
    Key([mod],"v",lazy.spawn("alacritty -e nvim"),desc="Run neovim"),

    # Browser keybinds
    KeyChord([mod],"b", [
        Key([mod],"b",lazy.spawn(myBrowser),desc="Open Firefox"),
        Key([],"b",lazy.spawn(myBrowser),desc="Open Firefox"),
        Key([mod],"w",lazy.spawn(myBrowser+ " -new-window web.whatsapp.com"),desc="Open WhatsApp Web"),
        Key([],"w",lazy.spawn(myBrowser+ " -new-window web.whatsapp.com"),desc="Open WhatsApp Web"),
        Key([mod],"t",lazy.spawn("telegram-desktop"),desc="Open Telegram Desktop"),
        Key([],"t",lazy.spawn("telegram-desktop"),desc="Open Telegram Desktop"),
        Key([mod],"a",lazy.spawn(myBrowser+" -new-window https://ad.uib.es/estudis2324/my/"),desc="Abrir Aula Digital"),
        Key([],"a",lazy.spawn(myBrowser+" -new-window https://ad.uib.es/estudis2324/my/"),desc="Abrir Aula Digital"),
        Key([mod],"o",lazy.spawn(myBrowser+" -new-window https://overleaf.com"),desc="Abrir Overleaf"),
        Key([],"o",lazy.spawn(myBrowser+" -new-window https://overleaf.com"),desc="Abrir Overleaf"),
        Key([mod],"c",lazy.spawn(myBrowser+" -new-window https://outlook.office365.com/mail"),desc="Abrir Outlook"),
        Key([],"c",lazy.spawn(myBrowser+" -new-window https://outlook.office365.com/mail"),desc="Abrir Outlook"),
        Key([mod],"g",lazy.spawn(myBrowser+" -new-window https://gmail.com"),desc="Abrir Gmail"),
        Key([],"g",lazy.spawn(myBrowser+" -new-window https://gmail.com"),desc="Abrir Gmail")
    ]),
    
    KeyChord([mod],"w",[
        Key([],"e",lazy.function(command_run,'write-email'),desc="Write email"),
    ]),

    KeyChord([mod],"c",[
        Key([],"c",lazy.spawn("alacritty -e nnn ~/.config"), desc="Open config folder with nnn"),
        Key([mod],"c",lazy.spawn("alacritty -e nnn ~/.config"), desc="Open config folder with nnn"),
        Key([],"v",lazy.spawn("alacritty -e nnn ~/.config/nvim"),desc="Open nvim config folder with nnn"),
        Key([mod],"v",lazy.spawn("alacritty -e nnn ~/.config/nvim"),desc="Open nvim config folder with nnn"),
    ]),
    # Write keybinds
    # KeyChord([mod],"w",[
        # Key([mod],"w",lazy.spawn(write-email),desc="Write email frank.william.hammond@gmail.com"),
        # Key([],"w",lazy.spawn(write-email),desc="Write email")
    # ]),

    # Zathura
    # Key([mod],"z",lazy.spawn("zathura"),desc="Open Zathura"),

    # Emoji
    Key([mod],"e",lazy.spawn("dm-emoji"),desc="Emoji List"),

    # RStudio
    Key([mod,alt],"r",lazy.spawn(["sh", "-c", "rstudio"]),desc="Launch RStudio"),
    
    # nnn (file manager)
    Key([mod],"n",lazy.spawn("alacritty -e nnn"),desc="Launch nnn"),

    # Taskell (Kanban task manager)
    # Key([mod,alt],"k",lazy.spawn("kanban"),desc="Open taskell"),

    # END CUSTOM FRANK

    Key([mod, shift],enter,lazy.layout.toggle_split(),desc="Toggle between split and unsplit sides of stack"),
    Key([mod], enter, lazy.spawn(myTerm), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], tab, lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, ctrl], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, ctrl], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, ctrl, shift], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

# groups = [Group(i) for i in "123456789"]


group_names=[str(i) for i in range(1,10)]
group_labels=["","","󰖟","","","","󰃭","","󰭹"]
group_layouts=["monadtall","max","monadtall","monadtall","monadtall","monadtall","monadtall","max","monadtall"]
# group_default_apps=[""] * len(group_names)
# group_default_apps[2]="myBrowser"

groups=[Group(name=group_names[i],layout=group_layouts[i],label=group_labels[i]) for i in range(len(group_names))]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, shift],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, shift], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

def init_layout_themes():
    return {"border_width":2,
            "border_focus": "#1fd592",
            }

layout_theme=init_layout_themes()

layouts = [
    layout.MonadTall(single_border_width=0,**layout_theme),
    layout.Max(),
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Ubuntu Bold",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


colors=[
    ["#1c1f24","#1c1f24"], # 0 background
    ["#e1edff","#e1edff"], # 1 font
    ["#3cdb82","#3cdb82"], # 2 columns
    ["#9a70e0","#9a70e0"], # 3 window
    ["#e03b51","#e03b51"], # 4 wifi
    ["#0737c2","#0737c2"], # 5 vol
    ["#e8e136","#e8e136"], # 6 ram
    ["#00E8b0","#00E8b0"], # 7 cpu
    ["#ff8e8e","#ff8e8e"], # 8 updates
    ["#2fc42c","#2fc42c"],  # 9 date
    ["#169f4f","#169f4f"]  #10 selection
]

screens = [
    Screen(
        wallpaper=os.path.join(os.path.expanduser("~"), "../../usr/share/wallpaper"),
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.GroupBox(
                fontsize = 15,
                margin_y = 4,
                margin_x = 4,
                padding_y = 2,
                padding_x = 3,
                borderwidth = 3,
                active = colors[2],
                inactive = colors[1],
                rounded = False,
                highlight_color = colors[0],
                highlight_method = "line",
                this_current_screen_border = colors[10]
                # this_screen_border = colors [4],
                # other_current_screen_border = colors[7],
                # other_screen_border = colors[4],
                ),
                widget.TextBox(
                    text = '|',
                    font = "Ubuntu Bold",
                    foreground = colors[1],
                    padding = 2,
                    fontsize = 12
                ),
                widget.CurrentLayout(
                    foreground = colors[1],
                    padding = 5
                ),
                widget.TextBox(
                    text = '|',
                    font = "Ubuntu Bold",
                    foreground = colors[1],
                    padding = 2,
                    fontsize = 12
                ),
                # widget.TextBox(lambda: qtile.cmd_spawn("echo_test")),
                widget.WindowName(
                    foreground = colors[3],
                    max_chars = 40
                ),
                widget.Memory(
                 foreground = colors[8],
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
                 format = '{MemUsed: .0f}{mm}',
                 fmt = 'RAM: {}',
                 decorations=[
                     BorderDecoration(
                         colour = colors[8],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
                widget.CPU(
                 format = 'CPU: {load_percent}%',
                 foreground = colors[4],
                 decorations=[
                     BorderDecoration(
                         colour = colors[4],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),


#               widget.Volume(
#                foreground = colors[7],
#                 fmt = 'Vol: {}',
#                 decorations=[
#                    BorderDecoration(
#                         colour = colors[7],
#                         border_width = [0, 0, 2, 0],
#                    )
#                 ],
#                 ),

                # widget.Spacer(length = 8),
                widget.GenPollText(
                    name = 'checkvolume',
                    update_interval = 0.5,
                    foreground = colors[7], # Text color

                    func = lambda: subprocess.check_output(
                        '/home/frank/scripts/volume',
                    ).decode('utf-8').strip(),
                    decorations=[BorderDecoration(colour = colors[7],border_width = [0, 0, 2, 0],)], # Border color
                ),

                widget.DF(
                 update_interval = 120,
                 foreground = colors[5],
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e df')},
                 partition = '/',
                 #format = '[{p}] {uf}{m} ({r:.0f}%)',
                 format = '{uf}{m} free',
                 fmt = 'DISK: {}',
                 visible_on_warn = False,
                 decorations=[
                     BorderDecoration(
                         colour = colors[5],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),


                widget.CheckUpdates(),
                widget.Prompt(),
                # widget.WindowName(),
                # widget.Backlight(),
                widget.BatteryIcon(),
                # widget.Wifi(),
                # widget.TextBox("default config", name="default"),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(format="⏱ %H:%M - %a %d %b %Y"),
                # widget.QuickExit(),
            ],
            20,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
