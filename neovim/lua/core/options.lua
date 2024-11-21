local opt = vim.opt -- deconstruct vim options

-- default position
opt.scrolloff = 5

-- ex line
vim.o.ls = 0
vim.o.ch = 0

-- line number
opt.number = true
opt.relativenumber = true

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line
opt.wrap = false

-- search
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- backup
opt.backup = false
opt.swapfile = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- misc
-- opt.guicursor = ""
opt.isfname:append("@-@")
opt.signcolumn = "yes"
opt.updatetime = 50
opt.wrap = false
