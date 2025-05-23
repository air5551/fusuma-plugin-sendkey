# frozen_string_literal: true

require_relative "ioctl"

module Fusuma
  module Plugin
    module Sendkey
      module Linux
        # https://github.com/jtzero/vigilem-evdev/blob/master/lib/vigilem/evdev/system/input.rb?plain=1#L18
        module Input
          include Ioctl
          module Macros
            # /* get event bits */
            def EVIOCGBIT(evtype, len = 255)
              _IOC(_IOC_READ, "E", 0x20 + evtype, len)
            end
          end
          include Macros

          module EventTypes
            EV_SYN = 0x00
            EV_KEY = 0x01
            EV_REL = 0x02
            EV_ABS = 0x03
            EV_MSC = 0x04
            EV_SW = 0x05
            EV_LED = 0x11
            EV_SND = 0x12
            EV_REP = 0x14
            EV_FF = 0x15
            EV_PWR = 0x16
            EV_FF_STATUS = 0x17
            EV_MAX = 0x1f
            EV_CNT = (EV_MAX + 1)
          end
          include EventTypes

          module KeysAndButtons
            KEY_RESERVED = 0
            KEY_ESC = 1
            KEY_1 = 2
            KEY_2 = 3
            KEY_3 = 4
            KEY_4 = 5
            KEY_5 = 6
            KEY_6 = 7
            KEY_7 = 8
            KEY_8 = 9
            KEY_9 = 10
            KEY_0 = 11
            KEY_MINUS = 12
            KEY_EQUAL = 13
            KEY_BACKSPACE = 14
            KEY_TAB = 15
            KEY_Q = 16
            KEY_W = 17
            KEY_E = 18
            KEY_R = 19
            KEY_T = 20
            KEY_Y = 21
            KEY_U = 22
            KEY_I = 23
            KEY_O = 24
            KEY_P = 25
            KEY_LEFTBRACE = 26
            KEY_RIGHTBRACE = 27
            KEY_ENTER = 28
            KEY_LEFTCTRL = 29
            KEY_A = 30
            KEY_S = 31
            KEY_D = 32
            KEY_F = 33
            KEY_G = 34
            KEY_H = 35
            KEY_J = 36
            KEY_K = 37
            KEY_L = 38
            KEY_SEMICOLON = 39
            KEY_APOSTROPHE = 40
            KEY_GRAVE = 41
            KEY_LEFTSHIFT = 42
            KEY_BACKSLASH = 43
            KEY_Z = 44
            KEY_X = 45
            KEY_C = 46
            KEY_V = 47
            KEY_B = 48
            KEY_N = 49
            KEY_M = 50
            KEY_COMMA = 51
            KEY_DOT = 52
            KEY_SLASH = 53
            KEY_RIGHTSHIFT = 54
            KEY_KPASTERISK = 55
            KEY_LEFTALT = 56
            KEY_SPACE = 57
            KEY_CAPSLOCK = 58
            KEY_F1 = 59
            KEY_F2 = 60
            KEY_F3 = 61
            KEY_F4 = 62
            KEY_F5 = 63
            KEY_F6 = 64
            KEY_F7 = 65
            KEY_F8 = 66
            KEY_F9 = 67
            KEY_F10 = 68
            KEY_NUMLOCK = 69
            KEY_SCROLLLOCK = 70
            KEY_KP7 = 71
            KEY_KP8 = 72
            KEY_KP9 = 73
            KEY_KPMINUS = 74
            KEY_KP4 = 75
            KEY_KP5 = 76
            KEY_KP6 = 77
            KEY_KPPLUS = 78
            KEY_KP1 = 79
            KEY_KP2 = 80
            KEY_KP3 = 81
            KEY_KP0 = 82
            KEY_KPDOT = 83

            KEY_ZENKAKUHANKAKU = 85
            KEY_102ND = 86
            KEY_F11 = 87
            KEY_F12 = 88
            KEY_RO = 89
            KEY_KATAKANA = 90
            KEY_HIRAGANA = 91
            KEY_HENKAN = 92
            KEY_KATAKANAHIRAGANA = 93
            KEY_MUHENKAN = 94
            KEY_KPJPCOMMA = 95
            KEY_KPENTER = 96
            KEY_RIGHTCTRL = 97
            KEY_KPSLASH = 98
            KEY_SYSRQ = 99
            KEY_RIGHTALT = 100
            KEY_LINEFEED = 101
            KEY_HOME = 102
            KEY_UP = 103
            KEY_PAGEUP = 104
            KEY_LEFT = 105
            KEY_RIGHT = 106
            KEY_END = 107
            KEY_DOWN = 108
            KEY_PAGEDOWN = 109
            KEY_INSERT = 110
            KEY_DELETE = 111
            KEY_MACRO = 112
            KEY_MUTE = 113
            KEY_VOLUMEDOWN = 114
            KEY_VOLUMEUP = 115
            KEY_POWER = 116 # /* SC System Power Down */
            KEY_KPEQUAL = 117
            KEY_KPPLUSMINUS = 118
            KEY_PAUSE = 119
            KEY_SCALE = 120 # /* AL Compiz Scale (Expose) */

            KEY_KPCOMMA = 121
            KEY_HANGEUL = 122
            KEY_HANGUEL = KEY_HANGEUL
            KEY_HANJA = 123
            KEY_YEN = 124
            KEY_LEFTMETA = 125
            KEY_RIGHTMETA = 126
            KEY_COMPOSE = 127

            KEY_STOP = 128  # /* AC Stop */
            KEY_AGAIN = 129
            KEY_PROPS = 130  # /* AC Properties */
            KEY_UNDO = 131  # /* AC Undo */
            KEY_FRONT = 132
            KEY_COPY = 133  # /* AC Copy */
            KEY_OPEN = 134  # /* AC Open */
            KEY_PASTE = 135  # /* AC Paste */
            KEY_FIND = 136  # /* AC Search */
            KEY_CUT = 137  # /* AC Cut */
            KEY_HELP = 138  # /* AL Integrated Help Center */
            KEY_MENU = 139  # /* Menu (show menu) */
            KEY_CALC = 140  # /* AL Calculator */
            KEY_SETUP = 141
            KEY_SLEEP = 142  # /* SC System Sleep */
            KEY_WAKEUP = 143  # /* System Wake Up */
            KEY_FILE = 144  # /* AL Local Machine Browser */
            KEY_SENDFILE = 145
            KEY_DELETEFILE = 146
            KEY_XFER = 147
            KEY_PROG1 = 148
            KEY_PROG2 = 149
            KEY_WWW = 150  # /* AL Internet Browser */
            KEY_MSDOS = 151
            KEY_COFFEE = 152  # /* AL Terminal Lock/Screensaver */
            KEY_SCREENLOCK = KEY_COFFEE
            KEY_DIRECTION = 153
            KEY_CYCLEWINDOWS = 154
            KEY_MAIL = 155
            KEY_BOOKMARKS = 156  # /* AC Bookmarks */
            KEY_COMPUTER = 157
            KEY_BACK = 158  # /* AC Back */
            KEY_FORWARD = 159  # /* AC Forward */
            KEY_CLOSECD = 160
            KEY_EJECTCD = 161
            KEY_EJECTCLOSECD = 162
            KEY_NEXTSONG = 163
            KEY_PLAYPAUSE = 164
            KEY_PREVIOUSSONG = 165
            KEY_STOPCD = 166
            KEY_RECORD = 167
            KEY_REWIND = 168
            KEY_PHONE = 169  # /* Media Select Telephone */
            KEY_ISO = 170
            KEY_CONFIG = 171  # /* AL Consumer Control Configuration */
            KEY_HOMEPAGE = 172  # /* AC Home */
            KEY_REFRESH = 173  # /* AC Refresh */
            KEY_EXIT = 174  # /* AC Exit */
            KEY_MOVE = 175
            KEY_EDIT = 176
            KEY_SCROLLUP = 177
            KEY_SCROLLDOWN = 178
            KEY_KPLEFTPAREN = 179
            KEY_KPRIGHTPAREN = 180
            KEY_NEW = 181  # /* AC New */
            KEY_REDO = 182  # /* AC Redo/Repeat */

            KEY_F13 = 183
            KEY_F14 = 184
            KEY_F15 = 185
            KEY_F16 = 186
            KEY_F17 = 187
            KEY_F18 = 188
            KEY_F19 = 189
            KEY_F20 = 190
            KEY_F21 = 191
            KEY_F22 = 192
            KEY_F23 = 193
            KEY_F24 = 194

            KEY_PLAYCD = 200
            KEY_PAUSECD = 201
            KEY_PROG3 = 202
            KEY_PROG4 = 203
            KEY_DASHBOARD = 204  # /* AL Dashboard */
            KEY_SUSPEND = 205
            KEY_CLOSE = 206  # /* AC Close */
            KEY_PLAY = 207
            KEY_FASTFORWARD = 208
            KEY_BASSBOOST = 209
            KEY_PRINT = 210  # /* AC Print */
            KEY_HP = 211
            KEY_CAMERA = 212
            KEY_SOUND = 213
            KEY_QUESTION = 214
            KEY_EMAIL = 215
            KEY_CHAT = 216
            KEY_SEARCH = 217
            KEY_CONNECT = 218
            KEY_FINANCE = 219  # /* AL Checkbook/Finance */
            KEY_SPORT = 220
            KEY_SHOP = 221
            KEY_ALTERASE = 222
            KEY_CANCEL = 223  # /* AC Cancel */
            KEY_BRIGHTNESSDOWN = 224
            KEY_BRIGHTNESSUP = 225
            KEY_MEDIA = 226

            KEY_SWITCHVIDEOMODE = 227  # /* Cycle between available video
            #           outputs (Monitor/LCD/TV-out/etc) */
            KEY_KBDILLUMTOGGLE = 228
            KEY_KBDILLUMDOWN = 229
            KEY_KBDILLUMUP = 230

            KEY_SEND = 231  # /* AC Send */
            KEY_REPLY = 232  # /* AC Reply */
            KEY_FORWARDMAIL = 233  # /* AC Forward Msg */
            KEY_SAVE = 234  # /* AC Save */
            KEY_DOCUMENTS = 235

            KEY_BATTERY = 236

            KEY_BLUETOOTH = 237
            KEY_WLAN = 238
            KEY_UWB = 239

            KEY_UNKNOWN = 240

            KEY_VIDEO_NEXT = 241  # /* drive next video link */
            KEY_VIDEO_PREV = 242  # /* drive previous video link */
            KEY_BRIGHTNESS_CYCLE = 243  # /* brightness up, after max is min */
            KEY_BRIGHTNESS_AUTO = 244  # /* Set Auto Brightness: manual
            #          brightness control is off,
            #          rely on ambient */
            KEY_BRIGHTNESS_ZERO = KEY_BRIGHTNESS_AUTO
            KEY_DISPLAY_OFF = 245  # /* display device to off state */

            KEY_WWAN = 246  # /* Wireless WAN (LTE, UMTS, GSM, etc.) */
            KEY_WIMAX = KEY_WWAN
            KEY_RFKILL = 247  # /* Key that controls all radios */

            KEY_MICMUTE = 248  # /* Mute / unmute the microphone */
            #     /* Code  = 255 is reserved for special needs of AT keyboard driver */
            BTN_MISC = 0x100
            BTN_0 = 0x100
            BTN_1 = 0x101
            BTN_2 = 0x102
            BTN_3 = 0x103
            BTN_4 = 0x104
            BTN_5 = 0x105
            BTN_6 = 0x106
            BTN_7 = 0x107
            BTN_8 = 0x108
            BTN_9 = 0x109

            BTN_MOUSE = 0x110
            BTN_LEFT = 0x110
            BTN_RIGHT = 0x111
            BTN_MIDDLE = 0x112
            BTN_SIDE = 0x113
            BTN_EXTRA = 0x114
            BTN_FORWARD = 0x115
            BTN_BACK = 0x116
            BTN_TASK = 0x117

            BTN_JOYSTICK = 0x120
            BTN_TRIGGER = 0x120
            BTN_THUMB = 0x121
            BTN_THUMB2 = 0x122
            BTN_TOP = 0x123
            BTN_TOP2 = 0x124
            BTN_PINKIE = 0x125
            BTN_BASE = 0x126
            BTN_BASE2 = 0x127
            BTN_BASE3 = 0x128
            BTN_BASE4 = 0x129
            BTN_BASE5 = 0x12a
            BTN_BASE6 = 0x12b
            BTN_DEAD = 0x12f

            BTN_GAMEPAD = 0x130
            BTN_SOUTH = 0x130
            BTN_A = BTN_SOUTH
            BTN_EAST = 0x131
            BTN_B = BTN_EAST
            BTN_C = 0x132
            BTN_NORTH = 0x133
            BTN_X = BTN_NORTH
            BTN_WEST = 0x134
            BTN_Y = BTN_WEST
            BTN_Z = 0x135
            BTN_TL = 0x136
            BTN_TR = 0x137
            BTN_TL2 = 0x138
            BTN_TR2 = 0x139
            BTN_SELECT = 0x13a
            BTN_START = 0x13b
            BTN_MODE = 0x13c
            BTN_THUMBL = 0x13d
            BTN_THUMBR = 0x13e

            BTN_DIGI = 0x140
            BTN_TOOL_PEN = 0x140
            BTN_TOOL_RUBBER = 0x141
            BTN_TOOL_BRUSH = 0x142
            BTN_TOOL_PENCIL = 0x143
            BTN_TOOL_AIRBRUSH = 0x144
            BTN_TOOL_FINGER = 0x145
            BTN_TOOL_MOUSE = 0x146
            BTN_TOOL_LENS = 0x147
            BTN_TOOL_QUINTTAP = 0x148  # /* Five fingers on trackpad */
            BTN_TOUCH = 0x14a
            BTN_STYLUS = 0x14b
            BTN_STYLUS2 = 0x14c
            BTN_TOOL_DOUBLETAP = 0x14d
            BTN_TOOL_TRIPLETAP = 0x14e
            BTN_TOOL_QUADTAP = 0x14f  # /* Four fingers on trackpad */

            BTN_WHEEL = 0x150
            BTN_GEAR_DOWN = 0x150
            BTN_GEAR_UP = 0x151

            KEY_OK = 0x160
            KEY_SELECT = 0x161
            KEY_GOTO = 0x162
            KEY_CLEAR = 0x163
            KEY_POWER2 = 0x164
            KEY_OPTION = 0x165
            KEY_INFO = 0x166  # /* AL OEM Features/Tips/Tutorial */
            KEY_TIME = 0x167
            KEY_VENDOR = 0x168
            KEY_ARCHIVE = 0x169
            KEY_PROGRAM = 0x16a  # /* Media Select Program Guide */
            KEY_CHANNEL = 0x16b
            KEY_FAVORITES = 0x16c
            KEY_EPG = 0x16d
            KEY_PVR = 0x16e  # /* Media Select Home */
            KEY_MHP = 0x16f
            KEY_LANGUAGE = 0x170
            KEY_TITLE = 0x171
            KEY_SUBTITLE = 0x172
            KEY_ANGLE = 0x173
            KEY_ZOOM = 0x174
            KEY_MODE = 0x175
            KEY_KEYBOARD = 0x176
            KEY_SCREEN = 0x177
            KEY_PC = 0x178  # /* Media Select Computer */
            KEY_TV = 0x179  # /* Media Select TV */
            KEY_TV2 = 0x17a  # /* Media Select Cable */
            KEY_VCR = 0x17b  # /* Media Select VCR */
            KEY_VCR2 = 0x17c  # /* VCR Plus */
            KEY_SAT = 0x17d  # /* Media Select Satellite */
            KEY_SAT2 = 0x17e
            KEY_CD = 0x17f  # /* Media Select CD */
            KEY_TAPE = 0x180  # /* Media Select Tape */
            KEY_RADIO = 0x181
            KEY_TUNER = 0x182  # /* Media Select Tuner */
            KEY_PLAYER = 0x183
            KEY_TEXT = 0x184
            KEY_DVD = 0x185  # /* Media Select DVD */
            KEY_AUX = 0x186
            KEY_MP3 = 0x187
            KEY_AUDIO = 0x188 # /* AL Audio Browser */
            KEY_VIDEO = 0x189 # /* AL Movie Browser */
            KEY_DIRECTORY = 0x18a
            KEY_LIST = 0x18b
            KEY_MEMO = 0x18c # /* Media Select Messages */
            KEY_CALENDAR = 0x18d
            KEY_RED = 0x18e
            KEY_GREEN = 0x18f
            KEY_YELLOW = 0x190
            KEY_BLUE = 0x191
            KEY_CHANNELUP = 0x192 # /* Channel Increment */
            KEY_CHANNELDOWN = 0x193 # /* Channel Decrement */
            KEY_FIRST = 0x194
            KEY_LAST = 0x195 # /* Recall Last */
            KEY_AB = 0x196
            KEY_NEXT = 0x197
            KEY_RESTART = 0x198
            KEY_SLOW = 0x199
            KEY_SHUFFLE = 0x19a
            KEY_BREAK = 0x19b
            KEY_PREVIOUS = 0x19c
            KEY_DIGITS = 0x19d
            KEY_TEEN = 0x19e
            KEY_TWEN = 0x19f
            KEY_VIDEOPHONE = 0x1a0 # /* Media Select Video Phone */
            KEY_GAMES = 0x1a1 # /* Media Select Games */
            KEY_ZOOMIN = 0x1a2 # /* AC Zoom In */
            KEY_ZOOMOUT = 0x1a3 # /* AC Zoom Out */
            KEY_ZOOMRESET = 0x1a4 # /* AC Zoom */
            KEY_WORDPROCESSOR = 0x1a5 # /* AL Word Processor */
            KEY_EDITOR = 0x1a6 # /* AL Text Editor */
            KEY_SPREADSHEET = 0x1a7 # /* AL Spreadsheet */
            KEY_GRAPHICSEDITOR = 0x1a8 # /* AL Graphics Editor */
            KEY_PRESENTATION = 0x1a9 # /* AL Presentation App */
            KEY_DATABASE = 0x1aa # /* AL Database App */
            KEY_NEWS = 0x1ab # /* AL Newsreader */
            KEY_VOICEMAIL = 0x1ac # /* AL Voicemail */
            KEY_ADDRESSBOOK = 0x1ad # /* AL Contacts/Address Book */
            KEY_MESSENGER = 0x1ae # /* AL Instant Messaging */
            KEY_DISPLAYTOGGLE = 0x1af # /* Turn display (LCD) on and off */
            KEY_BRIGHTNESS_TOGGLE = KEY_DISPLAYTOGGLE
            KEY_SPELLCHECK = 0x1b0 # /* AL Spell Check */
            KEY_LOGOFF = 0x1b1 # /* AL Logoff */

            KEY_DOLLAR = 0x1b2
            KEY_EURO = 0x1b3

            KEY_FRAMEBACK = 0x1b4 # /* Consumer - transport controls */
            KEY_FRAMEFORWARD = 0x1b5
            KEY_CONTEXT_MENU = 0x1b6 # /* GenDesc - system context menu */
            KEY_MEDIA_REPEAT = 0x1b7 # /* Consumer - transport control */
            KEY_10CHANNELSUP = 0x1b8 # /* 10 channels up (10+) */
            KEY_10CHANNELSDOWN = 0x1b9 # /* 10 channels down (10-) */
            KEY_IMAGES = 0x1ba # /* AL Image Browser */

            KEY_DEL_EOL = 0x1c0
            KEY_DEL_EOS = 0x1c1
            KEY_INS_LINE = 0x1c2
            KEY_DEL_LINE = 0x1c3

            KEY_FN = 0x1d0
            KEY_FN_ESC = 0x1d1
            KEY_FN_F1 = 0x1d2
            KEY_FN_F2 = 0x1d3
            KEY_FN_F3 = 0x1d4
            KEY_FN_F4 = 0x1d5
            KEY_FN_F5 = 0x1d6
            KEY_FN_F6 = 0x1d7
            KEY_FN_F7 = 0x1d8
            KEY_FN_F8 = 0x1d9
            KEY_FN_F9 = 0x1da
            KEY_FN_F10 = 0x1db
            KEY_FN_F11 = 0x1dc
            KEY_FN_F12 = 0x1dd
            KEY_FN_1 = 0x1de
            KEY_FN_2 = 0x1df
            KEY_FN_D = 0x1e0
            KEY_FN_E = 0x1e1
            KEY_FN_F = 0x1e2
            KEY_FN_S = 0x1e3
            KEY_FN_B = 0x1e4

            KEY_BRL_DOT1 = 0x1f1
            KEY_BRL_DOT2 = 0x1f2
            KEY_BRL_DOT3 = 0x1f3
            KEY_BRL_DOT4 = 0x1f4
            KEY_BRL_DOT5 = 0x1f5
            KEY_BRL_DOT6 = 0x1f6
            KEY_BRL_DOT7 = 0x1f7
            KEY_BRL_DOT8 = 0x1f8
            KEY_BRL_DOT9 = 0x1f9
            KEY_BRL_DOT10 = 0x1fa

            KEY_NUMERIC_0 = 0x200 # /* used by phones, remote controls, */
            KEY_NUMERIC_1 = 0x201 # /* and other keypads */
            KEY_NUMERIC_2 = 0x202
            KEY_NUMERIC_3 = 0x203
            KEY_NUMERIC_4 = 0x204
            KEY_NUMERIC_5 = 0x205
            KEY_NUMERIC_6 = 0x206
            KEY_NUMERIC_7 = 0x207
            KEY_NUMERIC_8 = 0x208
            KEY_NUMERIC_9 = 0x209
            KEY_NUMERIC_STAR = 0x20a
            KEY_NUMERIC_POUND = 0x20b

            KEY_CAMERA_FOCUS = 0x210
            KEY_WPS_BUTTON = 0x211 # /*  WiFi Protected Setup key */

            KEY_TOUCHPAD_TOGGLE = 0x212 # /*  Request switch touchpad on or off */
            KEY_TOUCHPAD_ON = 0x213
            KEY_TOUCHPAD_OFF = 0x214

            KEY_CAMERA_ZOOMIN = 0x215
            KEY_CAMERA_ZOOMOUT = 0x216
            KEY_CAMERA_UP = 0x217
            KEY_CAMERA_DOWN = 0x218
            KEY_CAMERA_LEFT = 0x219
            KEY_CAMERA_RIGHT = 0x21a

            KEY_ATTENDANT_ON = 0x21b
            KEY_ATTENDANT_OFF = 0x21c
            KEY_ATTENDANT_TOGGLE = 0x21d # /* Attendant call on or off */
            KEY_LIGHTS_TOGGLE = 0x21e # /* Reading light on or off */

            BTN_DPAD_UP = 0x220
            BTN_DPAD_DOWN = 0x221
            BTN_DPAD_LEFT = 0x222
            BTN_DPAD_RIGHT = 0x223

            KEY_ALS_TOGGLE = 0x230 # /* Ambient light sensor */

            KEY_BUTTONCONFIG = 0x240   # AL Button Configuration */
            KEY_TASKMANAGER = 0x241 # /* AL Task/Project Manager */
            KEY_JOURNAL = 0x242 # /* AL Log/Journal/Timecard */
            KEY_CONTROLPANEL = 0x243 # /* AL Control Panel */
            KEY_APPSELECT = 0x244 # /* AL Select Task/Application */
            KEY_SCREENSAVER = 0x245 # /* AL Screen Saver */
            KEY_VOICECOMMAND = 0x246   # Listening Voice Command */

            KEY_BRIGHTNESS_MIN = 0x250 # /* Set Brightness to Minimum */
            KEY_BRIGHTNESS_MAX = 0x251 # /* Set Brightness to Maximum */

            KEY_KBDINPUTASSIST_PREV = 0x260
            KEY_KBDINPUTASSIST_NEXT = 0x261
            KEY_KBDINPUTASSIST_PREVGROUP = 0x262
            KEY_KBDINPUTASSIST_NEXTGROUP = 0x263
            KEY_KBDINPUTASSIST_ACCEPT = 0x264
            KEY_KBDINPUTASSIST_CANCEL = 0x265

            BTN_TRIGGER_HAPPY = 0x2c0
            BTN_TRIGGER_HAPPY1 = 0x2c0
            BTN_TRIGGER_HAPPY2 = 0x2c1
            BTN_TRIGGER_HAPPY3 = 0x2c2
            BTN_TRIGGER_HAPPY4 = 0x2c3
            BTN_TRIGGER_HAPPY5 = 0x2c4
            BTN_TRIGGER_HAPPY6 = 0x2c5
            BTN_TRIGGER_HAPPY7 = 0x2c6
            BTN_TRIGGER_HAPPY8 = 0x2c7
            BTN_TRIGGER_HAPPY9 = 0x2c8
            BTN_TRIGGER_HAPPY10 = 0x2c9
            BTN_TRIGGER_HAPPY11 = 0x2ca
            BTN_TRIGGER_HAPPY12 = 0x2cb
            BTN_TRIGGER_HAPPY13 = 0x2cc
            BTN_TRIGGER_HAPPY14 = 0x2cd
            BTN_TRIGGER_HAPPY15 = 0x2ce
            BTN_TRIGGER_HAPPY16 = 0x2cf
            BTN_TRIGGER_HAPPY17 = 0x2d0
            BTN_TRIGGER_HAPPY18 = 0x2d1
            BTN_TRIGGER_HAPPY19 = 0x2d2
            BTN_TRIGGER_HAPPY20 = 0x2d3
            BTN_TRIGGER_HAPPY21 = 0x2d4
            BTN_TRIGGER_HAPPY22 = 0x2d5
            BTN_TRIGGER_HAPPY23 = 0x2d6
            BTN_TRIGGER_HAPPY24 = 0x2d7
            BTN_TRIGGER_HAPPY25 = 0x2d8
            BTN_TRIGGER_HAPPY26 = 0x2d9
            BTN_TRIGGER_HAPPY27 = 0x2da
            BTN_TRIGGER_HAPPY28 = 0x2db
            BTN_TRIGGER_HAPPY29 = 0x2dc
            BTN_TRIGGER_HAPPY30 = 0x2dd
            BTN_TRIGGER_HAPPY31 = 0x2de
            BTN_TRIGGER_HAPPY32 = 0x2df
            BTN_TRIGGER_HAPPY33 = 0x2e0
            BTN_TRIGGER_HAPPY34 = 0x2e1
            BTN_TRIGGER_HAPPY35 = 0x2e2
            BTN_TRIGGER_HAPPY36 = 0x2e3
            BTN_TRIGGER_HAPPY37 = 0x2e4
            BTN_TRIGGER_HAPPY38 = 0x2e5
            BTN_TRIGGER_HAPPY39 = 0x2e6
            BTN_TRIGGER_HAPPY40 = 0x2e7
            #
            #     /* We avoid low common keys in module aliases so they don't get huge. */
            KEY_MIN_INTERESTING = KEY_MUTE
            KEY_MAX = 0x2ff
            KEY_CNT = (KEY_MAX + 1)
          end
          include KeysAndButtons
        end
      end
    end
  end
end
