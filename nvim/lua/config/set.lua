vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "i:hor20"
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.wrap = true
vim.opt.colorcolumn = "80"
vim.opt.hlsearch = false
vim.opt.encoding = "utf-8"
vim.opt.showcmd = true
vim.opt.incsearch = true
vim.opt.scrolloff = 7
vim.opt.mouse = "a"
vim.opt.laststatus = 2
vim.opt.signcolumn = "yes"
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 1
vim.opt.fillchars = "fold: "
function custom_fold_text()
  local indent = vim.fn.indent(vim.v.foldstart - 1)
  local fold_size = 1 + vim.v.foldend - vim.v.foldstart
  local fold_size_str = " " .. fold_size .. " lines "
  local fold_level_str = string.rep("    +--", vim.v.foldlevel)
  local expansion_string = string.rep(" ", indent)
  return expansion_string .. fold_level_str .. fold_size_str
end

-- Set the fold text to the custom function
vim.api.nvim_exec([[
  set foldtext=luaeval('custom_fold_text()')
]], false)
