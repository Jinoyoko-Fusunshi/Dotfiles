-- keyboard layout
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

-- default navigation keybinds
vim.keymap.set('n', 'j', 'h', { noremap = true })  -- j = left
vim.keymap.set('n', 'k', 'j', { noremap = true })  -- k = up
vim.keymap.set('n', 'l', 'k', { noremap = true })  -- l = down
vim.keymap.set('n', 'ö', 'l', { noremap = true })  -- ö = right

vim.keymap.set('n', 'J', '<C-w>h')
vim.keymap.set('n', 'K', '<C-w>j')
vim.keymap.set('n', 'L', '<C-w>k')
vim.keymap.set('n', 'Ö', '<C-w>l')

-- custom vim function keybinds 
vim.keymap.set('n', '<leader>nf', ':tabnew<CR>', {desc = 'Opens a new file buffer tab' })
vim.keymap.set('n', '<C-s>', ':w<CR>', {desc = 'Saves your current text buffer'})
vim.keymap.set('n', '<C-x>', ':wq<CR>', {desc = 'Closes your current text buffer and saves the content to its file' })
vim.keymap.set('n', '<C-S-g>', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<C-S-f>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<C-S-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-n>', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '<C-S-t>', ':vsplit | terminal<CR>')
vim.keymap.set('n', '<C-S-A-t>',  ':split | terminal<CR>')

-- code completion
vim.keymap.set('n', '<C-.>', vim.lsp.buf.code_action, { desc = "Code hover" })
vim.keymap.set('n', '<C-,>', vim.lsp.buf.signature_help, { desc = 'Code completion' })

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- package manager
require("config.lazy")

-- load theme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- load file explorer
local tele = require("telescope.builtin")
vim.keymap.set('n', '<C-S-p>', tele.find_files, {})
vim.keymap.set('n', '<leader>fg', tele.live_grep, {})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- mis. plugins
require("nvim-tree").setup()


require("lualine").setup()

require("lspconfig")

-- code completion
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<BS>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ['<Down>']    = cmp.mapping.select_next_item(),
        ['<Up>']      = cmp.mapping.select_prev_item(),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }
})

-- lsp configurations
local capabilities = require('cmp_nvim_lsp').default_capabilities()