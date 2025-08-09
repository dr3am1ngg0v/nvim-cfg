-- Telescope binds
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>gf", ":Telescope git_files<CR>")
vim.keymap.set("n", "<leader>lg", ":Telescope live_grep<CR>")

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")

-- Markdown Preview (doesn't work on Hyprland or I'm too dumb to fix this lmao)
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>")

-- nvim-comment
vim.keymap.set({"n", "v"}, "<leader>/", ":CommentToggle<CR>")

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
