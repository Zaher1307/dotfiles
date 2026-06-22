vim.g.lazygit_floating_window_winblend            = 0
vim.g.lazygit_floating_window_scaling_factor      = 0.95
vim.g.lazygit_floating_window_border_chars        = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
vim.g.lazygit_floating_window_use_plenary         = 0
vim.g.lazygit_use_neovim_remote                   = 0

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>",
    { silent = true, desc = "Lazygit (cwd)" })

vim.keymap.set("n", "<leader>gf", "<cmd>LazyGitCurrentFile<cr>",
    { silent = true, desc = "Lazygit (current file's repo)" })
