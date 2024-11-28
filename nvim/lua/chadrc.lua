local options = {

    base46 = {
        theme = "poimandres", -- default theme
        hl_add = {},
        hl_override = {

            Comment = { italic = true, fg = "#3A5F76" },
            ["@comment"] = { link = "Comment" },
            ["@comment.rust"] = { link = "Comment" },
            ["@comment.python"] = { link = "Comment" },
            ["@comment.java"] = { link = "Comment" },
            ["@comment.go"] = { link = "Comment" },
            ["@comment.markdown"] = { link = "Comment" },
            ["@comment.txt"] = { link = "Comment" },
            ["@comment.css"] = { link = "Comment" },
            ["@comment.toml"] = { link = "Comment" },

            -- Types
            ["rustTypedef"] = { italic = true },
            ["type"] = { italic = true },
            ["@type"] = { italic = true },
            ["Type"] = { italic = true },

            -- Delimiter for miniIndent lines
            ["Delimiter"] = { fg = "#4c566a" },
            ["@delimiter"] = { link = "Delimiter" },

            -- tablines
            ["TbFill"] = { bg = "#191724" },
            ["TbBufOff"] = {bg = "#191724"},
        },
        integrations = {},
        changed_themes = {},
        transparency = true,
        theme_toggle = { "poimandres", "poimandres" },
    },

    ui = {
        cmp = {
            icons_left = false, -- only for non-atom styles!
            lspkind_text = true,
            style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
            format_colors = {
                tailwind = true, -- will work for css lsp too
                icon = "󱓻",
            },
        },

        telescope = { style = "bordered" }, -- borderless / bordered

        statusline = {
            enabled = true,
            theme = "minimal", -- default/vscode/vscode_colored/minimal
            -- default/round/block/arrow separators work only for default statusline theme
            -- round and block will work for minimal theme only
            separator_style = "round",
            order = nil,
            modules = nil,
        },

        -- lazyload it when there are 1+ buffers
        tabufline = {
            enabled = true,
            lazyload = true,
            order = { "treeOffset", "buffers", "tabs", "btns" },
            modules = nil,
        },
    },

    nvdash = {
        load_on_startup = true,
        header = {
            "                            ",
            "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
            "   ▄▀███▄     ▄██ █████▀    ",
            "   ██▄▀███▄   ███           ",
            "   ███  ▀███▄ ███           ",
            "   ███    ▀██ ███           ",
            "   ███      ▀ ███           ",
            "   ▀██ █████▄▀█▀▄██████▄    ",
            "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
            "                            ",
            "     Powered By  eovim    ",
            "                            ",
        },

        buttons = {
            { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
            { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
            { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
            { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
            { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

            { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

            {
                txt = function()
                    local stats = require("lazy").stats()
                    local ms = math.floor(stats.startuptime) .. " ms"
                    return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
                end,
                hl = "NvDashFooter",
                no_gap = true,
            },

            { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
        },
    },

    term = {
        winopts = { number = false, relativenumber = false },
        sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
        float = {
            relative = "editor",
            row = 0.3,
            col = 0.25,
            width = 0.5,
            height = 0.4,
            border = "single",
        },
    },

    lsp = { signature = true },

    cheatsheet = {
        theme = "grid", -- simple/grid
        excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
    },

    mason = { pkgs = {}, skip = {} },

    colorify = {
        enabled = true,
        mode = "virtual", -- fg, bg, virtual
        virt_text = "󱓻 ",
        highlight = { hex = true, lspvars = true },
    },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
