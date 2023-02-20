-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
  -- Package manager
  use("wbthomason/packer.nvim")

  use({
      -- LSP Configuration & Plugins
      "neovim/nvim-lspconfig",
      requires = {
          -- Useful status updates for LSP
          "j-hui/fidget.nvim",

          -- Additional lua configuration, makes nvim stuff amazing
          "folke/neodev.nvim",
      },
  })

  use({
      -- EasyMotion-like plugin allowing you to jump anywhere
      "phaazon/hop.nvim",
      branch = "v2", -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
      end,
  })

  use({
      -- Autocompletion
      "hrsh7th/nvim-cmp",
      requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
  })

  use({
      -- Highlight, edit, and navigate code
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
  })

  use({
      -- Additional text objects via treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
  })

  -- Git related plugins
  use("lewis6991/gitsigns.nvim")

  use("navarasu/onedark.nvim") -- Theme inspired by Atom
  use("nvim-lualine/lualine.nvim") -- Fancier statusline
  use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines
  use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically
  use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
  use({
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup({})
      end,
  }) -- Auto close brackets

  -- Fuzzy Finder (files, lsp, etc)
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

  -- File explorer
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
  }

  -- Linters and formatters
  use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("null-ls").setup()
      end,
      requires = { "nvim-lua/plenary.nvim" },
  })

  -- Outline
  use 'simrat39/symbols-outline.nvim'

  -- Competitive programming
  use 'p00f/cphelper.nvim'

  -- Java language server
  use 'mfussenegger/nvim-jdtls'

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, "custom.plugins")
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require("packer").sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print("==================================")
  print("    Plugins are being installed")
  print("    Wait until Packer completes,")
  print("       then restart nvim")
  print("==================================")
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    command = "source <afile> | silent! LspStop | silent! LspStart | PackerCompile",
    group = packer_group,
    pattern = vim.fn.expand("$MYVIMRC"),
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Highlight current line and current column
vim.opt.cursorline = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Make the system clipboard work with Neovim
vim.o.clipboard = "unnamedplus"

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Competitive programming helper
vim.g["cph#dir"] = "/home/xxgj/projects/algorithm"
vim.g["cph#vsplit"] = true
vim.g["cph#cpp#compile_command"] = "g++ -std=c++17 -O2 -DXXGJ_DEBUG solution.cpp -o cpp.out"

-- Set colorscheme
vim.o.termguicolors = true
require('onedark').load()

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- Enable Comment.nvim
require("Comment").setup()

-- Gitsigns
-- See `:help gitsigns.txt`
require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      map("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
        },
    },
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
      winblend = 10,
      previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require("nvim-treesitter.configs").setup({
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { "c", "cpp", "go", "lua", "vim", "python", "rust", "typescript", "java", "sql", "markdown", "help" },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
    },
})

-- format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
  end, bufopts)

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
  end
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup LSP
require("lspconfig").pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

require("lspconfig").clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

require("lspconfig").sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_lua").load()

cmp.setup({
    snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs( -4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable( -1) then
            luasnip.jump( -1)
          else
            fallback()
          end
        end, { "i", "s" }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
})

-- Hop configuration
local hop = require("hop")
vim.keymap.set("", "s", function()
  hop.hint_char1()
end, { remap = true })

-- Auto save
vim.keymap.set({ "n", "i" }, "<C-[>", "<Esc>:w<CR>", { silent = true })

-- Setup null-ls
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.autopep8.with({ extra_args = { "--experimental" } }),
        null_ls.builtins.formatting.prettier.with({ extra_args = { "--prose-wrap=always" } }),
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = on_attach,
})

-- Setup nvim-tree
require("nvim-tree").setup({
    view = {
        relativenumber = true,
    },
    filters = {
        custom = { "^.git$" },
    },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- Set lualine as statusline
-- See `:help lualine.txt`
require("lualine").setup({
    options = {
        icons_enabled = false,
        theme = "onedark",
        component_separators = "|",
        section_separators = "",
    },
})

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require("indent_blankline").setup({
    char = "┊",
    show_trailing_blankline_indent = false,
})

-- Turn on lsp status information
require("fidget").setup()

-- Setup outline
require("symbols-outline").setup()

vim.keymap.set("n", "<leader>o", ":SymbolsOutline<CR>", { silent = true })

-- Setup cphelper
vim.keymap.set("n", "<leader>r", ":CphReceive<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":CphTest<CR>", { silent = true })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
