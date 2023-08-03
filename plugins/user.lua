return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "rhysd/clever-f.vim",
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      vim.api.nvim_set_hl(
        0,
        "CleverChar",
        { underline = true, bold = true, fg = "Orange", bg = "NONE", ctermfg = "Red", ctermbg = "NONE" }
      )
      vim.g.clever_f_mark_char_color = "CleverChar"
      vim.g.clever_f_mark_direct_color = "CleverChar"
      vim.g.clever_f_mark_direct = true
      vim.g.clever_f_timeout_ms = 1500
    end,
  },
  {
    "smoka7/hop.nvim",
    lazy = true,
    version = "*",
    event = { "CursorHold", "CursorHoldI" },
    config = function() require("hop").setup { keys = "etovxqpdygfblzhckisuran" } end,
  },
  {
    "lambdalisue/suda.vim",
    lazy = true,
    cmd = { "SudaRead", "SudaWrite" },
    config = function() vim.g["suda#prompt"] = "Enter administrator password: " end,
  },

  {
    "ibhagwan/smartyank.nvim",
    lazy = true,
    event = "BufReadPost",
    config = function()
      require("smartyank").setup {
        highlight = {
          enabled = false, -- highlight yanked text
          higroup = "IncSearch", -- highlight group of yanked text
          timeout = 2000, -- timeout for clearing the highlight
        },
        clipboard = {
          enabled = true,
        },
        tmux = {
          enabled = true,
          -- remove `-w` to disable copy to host client's clipboard
          cmd = { "tmux", "set-buffer", "-w" },
        },
        osc52 = {
          enabled = true,
          escseq = "tmux", -- use tmux escape sequence, only enable if you're using remote tmux and have issues (see #4)
          ssh_only = true, -- false to OSC52 yank also in local sessions
          silent = false, -- true to disable the "n chars copied" echo
          echo_hl = "Directory", -- highlight group of the OSC52 echo message
        },
      }
    end,
  },
}
