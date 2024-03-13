local util = require("monokai-pro.util")
local config = require("monokai-pro.config")

local M = {}

M.create_filter_command = function()
  local cmd = vim.api.nvim_create_user_command

  cmd("MonokaiProSelect", function()
    local menu = util.ui.create_menu("Set monokai filter", {
      "classic",
      "octagon",
      "pro",
      "machine",
      "ristretto",
      "spectrum",
      "light"
    }, function(item)
      local filter = item.value
      config.extend({ filter = filter })
      vim.cmd([[colorscheme monokai-pro]])
      vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "grey", bold = false })
      vim.api.nvim_set_hl(0, "LineNr", { fg = config.filter == "light" and "#ffbf00" or "yellow", bold = true })
      vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "grey", bold = false })
    end)
    assert(menu, "Error: Fail to create menu")
    menu:mount()
  end, { nargs = 0 })

  cmd("MonokaiPro", function(opts)
    local filter = opts.args
    config.extend({ filter = filter })
    vim.cmd([[colorscheme monokai-pro]])
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "grey", bold = false })
    vim.api.nvim_set_hl(0, "LineNr", { fg = config.filter == "light" and "#ffbf00" or "yellow", bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "grey", bold = false })
  end, {
    nargs = 1,
    complete = function()
      return {
        "classic",
        "octagon",
        "pro",
        "machine",
        "ristretto",
        "spectrum",
        "light"
      }
    end,
  })
end

return M
