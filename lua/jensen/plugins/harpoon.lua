return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>ha", mark.add_file)
    vim.keymap.set("n", "<leader>hc", mark.clear_all)

    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
    vim.keymap.set("n", "<C-t>", ui.nav_next)
  end,
}
