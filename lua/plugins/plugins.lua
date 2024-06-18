return {
    {
        "lewis6991/gitsigns.nvim",
        config = true,
        opts = {
            on_attach = function(buffer)
                local gs = require("gitsigns")
                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                map("n", "gs", gs.toggle_current_line_blame, "toggle current lineblame")
            end,
        },
    },

    {
        "stevearc/conform.nvim",

        opts = {
            format = {
                lsp_fallback = false,
            },
        },
    },

    {
        "ojroques/nvim-osc52",
        config = function()
            local function copy(lines, _)
                require("osc52").copy(table.concat(lines, "\n"))
            end

            local function paste()
                return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
            end

            vim.g.clipboard = {
                name = "osc52",
                copy = { ["+"] = copy, ["*"] = copy },
                paste = { ["+"] = paste, ["*"] = paste },
            }

            -- Now the '+' register will copy to system clipboard using OSC52
            vim.keymap.set("v", "<A-c>", '"+y')
        end,
    },
}
