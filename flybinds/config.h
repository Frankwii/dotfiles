/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */
static int topbar = 1;                      /* -b  option; if 0, flybinds appears at bottom     */

/* -fn option overrides fonts[0]; default X11 font or font set */
static char font[] = "UbuntuMono Nerd Font:size=10";
static const char *fonts[] = {
	font,
    "monospace:size=40",
};
static char sep[]        = ":";      /* -s option; set the separator between key and text */ static char *maxkey      = "\\n";     /* max-length of key */
static char background[] = "#000000"; /* global background */
static char keyfg[]      = "#00ff00"; /* key name foreground */
static char sepfg[]      = "#00ffff"; /* separator foreground */
static char descfg[]     = "#ffffff"; /* description foreground */
static char bordercol[]  = "#ff0000"; /* border color */
static unsigned int backkey = XK_Left;

static char *colors[SchemeLast][2] = {
	/*                 fg          bg       */
	[SchemeKey]    = { keyfg,      background }, /* fg for key */
	[SchemeSep]    = { sepfg,      background }, /* fg for separator (->) */
	[SchemeDesc]   = { descfg,     background }, /* fg for description */
	[SchemeBorder] = { background, bordercol  }, /* bg for border */
};
/* -c option, if nonzero flybinds will set this number of colums. If not, it's calculated */
static unsigned int columns        = 0;   /* [-c]  max-columns (0 for auto) */
static unsigned int colpadding     = 50; /* [-cs] separation between cols */
static unsigned int outpaddinghor  = 40;  /* [-ph] */
static unsigned int outpaddingvert = 1;  /* [-pv] */
static unsigned int borderpx       = 1;   /* [-bw] */

/*
 * Xresources preferences to load at startup (the class to use is "flybinds")
 */
ResourcePref resources[] = {
	/*{ "font",           STRING,  &font },*/
	{ "separator",      STRING,  &sep },
	{ "maxcolumns",     INTEGER, &columns },
	{ "colpadding",     INTEGER, &colpadding },
	{ "outpaddinghor",  INTEGER, &outpaddinghor }, { "outpaddingvert", INTEGER, &outpaddingvert },
	{ "borderpx",       INTEGER, &borderpx },
	{ "background",     STRING,  &background },
	/*{ "background",     STRING,  &background },*/
	/*{ "keyfg",          STRING,  &keyfg },*/
	/*{ "sepfg",          STRING,  &sepfg },*/
	/*{ "descfg",         STRING,  &descfg },*/
	/*{ "bordercol",      STRING,  &bordercol },*/
	{ "color4",          STRING,  &keyfg },
	{ "color3",          STRING,  &sepfg },
	{ "color14",         STRING,  &descfg },
	{ "color1",      STRING,  &bordercol },
};

/* see keys.h to see the keynames */
/*
keyname          see keys.h
description      
script           path to script or NULL
keep open?       0 / 1
childs           submenu
childs length    LENGTH(submenu)
one per line?    0 / 1
*/

static item uib[] = {
  {"a", "Aula digital","$BROWSER -new-window https://ad.uib.es/estudis2425/my/"},
  {"A","Academic","$BROWSER -new-window https://academic.uib.cat/alu"},
  {"o", "Overleaf","$BROWSER -new-window https://www.overleaf.com"},
};

/*Layer 2*/
static item power[] = {
    { "O", "Poweroff", "systemctl poweroff"},
    { "R", "Reboot", "systemctl reboot"},
};

/*Layer 2*/
static item volume[] = {
    { "+", "Up 5%", "pactl set-sink-volume @DEFAULT_SINK@ +5%",1},
    { "-", "Down 5%", "pactl set-sink-volume @DEFAULT_SINK@ -5%",1},
    { "m", "Mute", "pactl set-sink-mute @DEFAULT_SINK@ 1", 0},
    { "u", "Unmute", "pactl set-sink-mute @DEFAULT_SINK@ 0", 0},
    { "t", "Toggle mute", "pactl set-sink-mute @DEFAULT_SINK@ toggle", 0},
};

/*Layer 2*/
static item social[] = {
    { "w",   "Whatsapp", "$BROWSER -new-window web.whatsapp.com"},
    { "t",   "Telegram", "telegram-desktop"},
    { "d",   "Discord", "discord"},
    { "m",   "Email", "$BROWSER -new-window https://gmail.com"},
    { "e",   "Email", "$BROWSER -new-window https://gmail.com"},
};

/*Layer 2*/
static item brightness[] = {
    {"+", "Up 5%","brightnessctl set 5%+",1},
    {"-", "Down 5%","brightnessctl set 5%-",1}
};

/*Layer 1*/
static item system_menu[] = {
    {"b", "Brightness", "", 0, brightness, 2, 0},
    {"v", "Volume", "", 0, volume, LENGTH(volume), 0},
    {"P", "Power", "", 0, power, LENGTH(power), 0},
};

/*Layer 1*/
static item launch[] = {
    {"n", "Open nnn", "$USERTERM -e nnn"},
    {"b", "Browser", "$BROWSER"},
    {"u", "UIB", "",0,uib,LENGTH(uib),0},
    {"v", "Nvim", "$USERTERM -e nvim"},
    {"e", "Emacs", "emacsclient -c -a 'emacs'"},
    {"s", "Social", "", 0, social, LENGTH(social), 0},
    {"m", "Spotify", "spotify-launcher"},
    {"g", "Steam", "steam"},
    {"c", "VSCode", "code"},
};

/*Layer 1*/
static item writeatcursor[] = {
    /*{ "B", "Submenu 2", NULL, 1, menu22, LENGTH(menu22) },*/
    { "e", "Email",             "sleep 0.1; xdotool type 'frank.william.hammond@gmail.com'"},
    { "a", "Alternative email", "sleep 0.1; xdotool type 'frank.william.hammond56@gmail.com'"},
};
    
/*Layer 0*/
static item items[] = {
    /* keyname  description    path to script          keep open?  childs  childs length    one per line */
    { "w",      "Write",        "",                    0,          writeatcursor,LENGTH(writeatcursor)      , 0 },
    { "l",      "Launch",       "",                    0,          launch,LENGTH(launch),   0 },
    { "s",      "System",       "",                    0,          system_menu,LENGTH(system_menu),   0 },
};
