local version = vim.version()
local banners = {
        [[                            . .  ,  ,                                    , ,\/\/\           ]],
        [[                            |` \/ \/ \,',                          , |\|\|`     :           ]],
        [[                            ;          ` \/\,.               .-.|`              \           ]],
        [[                           :               ` \,/            \-\                  \          ]],
        [[                           |                  /              \                    :         ]],
        [[                           ;                 :                \          ____ ,-^-.         ]],
        [[                          :                  ;                 \       ,'    `.   o\        ]],
        [[                          |      ,---.      /                   \     (    o  :    ;        ]],
        [[                         :     ,'     `,-._ \                    \     \      ;`-"' )       ]],
        [[                         ;    (   o    \   `'                     \_    `-..-'   -'(        ]],
        [[                       _:      .      ,'  o ;                    ,'a`               \       ]],
        [[                      /,.`      `.__,'`-.__,                     `._,'   ,           )      ]],
        [[                      \_  _               \                         \   '`----=-----'       ]],
        [[                     ,'  / `,          `.,'                         ;       ,-'             ]],
        [[               ___,'`-._ \_/ `,._        ;                         /        \               ]],
        [[            __;_,'      `-.`-'./ `--.____)                       ,'          \              ]],
        [[         ,-'           _,--\^-'                                 ;             \             ]],
        [[       ,:_____      ,-'     \                                  '    ,        \ \            ]],
        [[      (,'     `--.  \;-._    ;                                /    /    .    .) \           ]],
        [[      :    Y      `-/    `,  :                               :    /           \  \          ]],
        [[      :    :       :     /_;'                                ;   |;            \  :         ]],
        [[      :    :       |    :                                    ;   |              | |         ]],
        [[       \    \      :    :                                    \   |          .   | :         ]],
        [[        `-._ `-.__, \    `.                                  )   \             ,' |         ]],
        [[           \   \  `. \     `.                                ,    ) ,----------|_;;         ]],
        [[         ,-;    \---)_\ ,','/                               (_/ //  | CENSORED |            ]],
        [[         \_ `---'--'" ,'^-;'                                  `' |  |__________|            ]],
        [[         (_`     ---'" ,-')                                      |     ; |    |             ]],
        [[         / `--.__,. ,-'    \                                     |     | |    |             ]],
        [[         )-.__,-- ||___,--' `-.                                  |     |,'    `-._          ]],
        [[        /._______,|__________,'\                                 |     `-._    `..)         ]],
        [[        `--.____,'|_________,-'                                  |       `.;""---`          ]],
        [[                                                                  `--._;_)-'                ]],
}

local center = {
    {
        desc = "Find File ",
        key = "f",
        icon = " ",
        action = "Telescope find_files",
        group = "@markup.heading.1.markdown",
    },
    {
      desc = "Find Sessions ",
      key = "s",
      icon = " ",
      action = "FindSessions",
      group = "@markup.heading.2.markdown",
    },
    {
        desc = "New Spring Project",
        key = "n",
        icon = " ",
        action = "Springtime",
        group = "@markup.heading.3.markdown"
    },
    {
        desc = "Exit ",
        key = "q",
        icon = " ",
        action = "exit",
        group = "@markup.heading.4.markdown",
    },
}

local footer = {
    "",
    "Estou em um relacionamento sério com o meu código… mas ele sempre me decepciona.",
}

return {
    "nvimdev/dashboard-nvim",
    opts = {
        theme = "hyper",
        config = {
            header = banners,
            shortcut = center,
            footer = footer,
            packages = { enable = false },
            mru = { limit = 5, icon = ' ', label = 'Recent Files', cwd_only = false },
        },
    },
}
