vim.o.encoding = "utf-8"
vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.list = false
vim.o.winborder = "rounded"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
	pattern = "*.py",
	callback = function()
		vim.o.textwidth = 79
		vim.o.colorcolumn = "79"
	end
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
	pattern = {"*.js", "*.html", "*.css", "*.lua"},
	callback = function()
		vim.o.tabstop = 2
		vim.o.softtabstop = 2
		vim.o.shiftwidth = 2
	end
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.cmd("normal! g`\"")
		end
	end
})
