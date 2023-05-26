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
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require("neoscroll").setup {
        easing_function = "quadratic", -- Default easing function
        -- Set any other options as needed
      }

      local t = {}
      -- Syntax: t[keys] = {function, {function arguments}}
      -- Use the "sine" easing function
      t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "150" } }
      t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "150" } }
      -- Use the "circular" easing function
      t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "250" } }
      t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "250" } }
      -- Pass "nil" to disable the easing animation (constant scrolling speed)
      t["<C-y>"] = { "scroll", { "-0.10", "false", "50", nil } }
      t["<C-e>"] = { "scroll", { "0.10", "false", "50", nil } }
      -- When no easing function is provided the default easing function (in this case "quadratic") will be used
      t["zt"] = { "zt", { "50" } }
      t["zz"] = { "zz", { "50" } }
      t["zb"] = { "zb", { "50" } }

      require("neoscroll.config").set_mappings(t)
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
      }
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
}
