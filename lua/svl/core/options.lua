local opt = vim.opt -- shorthand

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indents
opt.tabstop = 2 -- I used to have 4 spaces, trying out 2s
opt.shiftwidth = 2 -- Again, used to be 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- File options
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Appearance
opt.termguicolors = true -- Use the terminals colors where applicable
opt.guicursor = ""

-- Searching
opt.hlsearch = false
opt.incsearch = true

-- Other
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"
