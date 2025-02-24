vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- disable comment jump to next line
-- https://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
vim.cmd([[autocmd BufNewFile,BufRead,BufEnter * setlocal formatoptions-=cro]])

-- general
lvim.log.level = "info"

-- key mappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
--# split with (h)orizontal
lvim.keys.normal_mode["<C-W>h"] = ":split<CR>"

-- don't open root directory
lvim.builtin.project.manual_mode = true
-- keep active for lazygit
lvim.builtin.terminal.active = true

lvim.builtin.which_key.mappings["v"] = {
    name = "Visual",
    b = { "<cmd>:set wrap!<cr>", "Toggle text wrap" },
}

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- Trigger `autoread` when files change on disk
vim.cmd([[set autoread]])
vim.cmd([[autocmd FocusGained * silent! checktime]])

-- Fuzzy find in current buffer
lvim.builtin.which_key.mappings["sT"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Fuzzy find in current buffer" }
lvim.builtin.which_key.mappings["sF"] = { "<cmd>Telescope buffers<CR>", "Find files in open buffers" }

-- Add keybinding for :MakeitOpen
lvim.builtin.which_key.mappings["m"] = { ":MakeitOpen<CR>", "MakeitOpen" }

-- nvim-tree file explorer
local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5  -- You can change this too
lvim.builtin.nvimtree.setup.view = {
    number = true,
    float = {
        enable = true,
        open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2)
                - vim.opt.cmdheight:get()
            return {
                border = "rounded",
                relative = "editor",
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
            }
        end,
    },
    width = function()
        return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
}

-- add syntax highlighting for langs not supported by treesitter
vim.cmd [[
  autocmd BufRead,BufNewFile *.puml,*.plantuml set filetype=plantuml
]]
