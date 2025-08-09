vim.cmd [[colorscheme tokyonight-moon]]

vim.o.termguicolors = true
require("bufferline").setup {}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})
