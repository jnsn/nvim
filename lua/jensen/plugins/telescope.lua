return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "mingw32-make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local builtin = require("telescope.builtin")
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "truncate " },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
      })

      telescope.load_extension("fzf")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files." })
      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find Git files." })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find Grep." })
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers." })
    end,
  },
  {
      "crispgm/telescope-heading.nvim",
      config = function()
          require("telescope").load_extension("heading")
      end,
  }
}
