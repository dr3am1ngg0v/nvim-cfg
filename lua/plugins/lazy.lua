local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {}
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({
        create_mappings = false
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0,
      })
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup {}
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ruff",
          "clangd",
          "omnisharp",
          "ts_ls",
          "eslint",
          "tailwindcss",
          "html",
          "cssls",
          "jdtls",
        },
        handlers = {
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' },
                  },
                },
              },
            })
          end,
          ["ruff"] = function ()
            require("lspconfig").ruff.setup({
              init_options = {
                settings = {
                },
              },
            })
          end,
          ["pyright"] = function()
            require("lspconfig").pyright.setup({
              settings = {
                pyright = {
                  disableOrganizeImports = true,
                },
                python = {
                  analysis = {
                    ignore = { '*' },
                  },
                },
              },
            })
          end,
          ["clangd"] = function()
            require("lspconfig").clangd.setup({
              cmd = { "clangd", "--background-index" },
              filetypes = { "c", "cpp", "objc", "objcpp" },
            })
          end,
          ["omnisharp"] = function()
            require("lspconfig").omnisharp.setup({
              cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
              enable_editorconfig_support = true,
              enable_ms_build_load_projects_on_demand = true,
            })
          end,
          -- ["ts_ls"] = function()
          --   require("lspconfig").ts_ls.setup({
          --     settings = {
          --       typescript = {
          --         inlayHints = {
          --           includeInlayParameterNameHints = "all",
          --           includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          --           includeInlayFunctionParameterTypeHints = true,
          --           includeInlayVariableTypeHints = true,
          --           includeInlayPropertyDeclarationTypeHints = true,
          --           includeInlayFunctionLikeReturnTypeHints = true,
          --           includeInlayEnumMemberValueHints = true
          --         },
          --       },
          --       javascript = {
          --         inlayHints = {
          --           includeInlayParameterNameHints = "all",
          --           includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          --           includeInlayFunctionParameterTypeHints = true,
          --           includeInlayVariableTypeHints = true,
          --           includeInlayPropertyDeclarationTypeHints = true,
          --           includeInlayFunctionLikeReturnTypeHints = true,
          --           includeInlayEnumMemberValueHints = true,
          --         },
          --       },
          --     },
          --   })
          -- end,
          ["tailwindcss"] = function ()
           require("lspconfig").tailwindcss.setup({
             filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
             settings = {
               tailwindCSS = {
                 experimental = {
                   classRegex = { "[\"'`]([^\"'`]*).*?[\"'`]" },
                 },
               },
             },
           })
          end,
          ["jdtls"] = function ()
            require("lspconfig").jdtls.setup({
              cmd = { "jdtls" },
              settings = {
                java = {
                  configuration = {
                    runtimes = {
                      {
                        name = "JavaSE-21",
                        path = "$HOME/jdk-21",
                      },
                    },
                  },
                },
              },
            })
          end,
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      }
    end
  },
})
