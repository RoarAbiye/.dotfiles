local o = vim.opt
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '
g.have_nerd_font = true

o.undofile = true

o.ignorecase = true
o.smartcase = true

o.updatetime = 250
o.timeoutlen = 300

o.number = true
o.relativenumber = true
o.signcolumn = 'yes'

o.termguicolors = true
o.background = 'dark'

o.mouse = 'a'
o.showmode = false
o.breakindent = true
o.splitright = true
o.splitbelow = true

o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.inccommand = 'split'
o.cursorline = true
o.scrolloff = 10

vim.cmd [[
sign define DiagnosticSignError text=󰯆 texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn text=󰚌 texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignInfo text=󱓇 texthl=DiagnosticSignInfo linehl= numhl=
sign define DiagnosticSignHint text=󱢏 texthl=DiagnosticSignHint linehl= numhl=
]]

vim.diagnostic.config { virtual_text = { prefix = '󱓻' } }
