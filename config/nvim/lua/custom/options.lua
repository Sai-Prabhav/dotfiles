local O = vim.opt

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g['prettier#config#print_width'] = 56

O.number = true
O.relativenumber = true
O.mouse = 'a'
O.showmode = false
O.clipboard = 'unnamedplus'
O.breakindent = true
O.undofile = true
O.ignorecase = true
O.smartcase = true
O.signcolumn = 'yes'
O.updatetime = 250
O.timeoutlen = 300
O.splitright = true
O.splitbelow = true
O.list = true
O.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
O.inccommand = 'split'
O.cursorline = true
O.scrolloff = 13
O.confirm = true
O.tabstop = 4
O.shiftwidth = 4
O.expandtab = true
O.foldmethod = 'expr'
O.foldexpr = 'nvim_treesitter#foldexpr()'
O.foldlevelstart = 99
O.spelllang = 'en_us'
O.spell = true

vim.g.vimtex_view_method = 'zathura'
