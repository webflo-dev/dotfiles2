return {
  { "ThePrimeagen/vim-be-good" },

  {
    "theprimeagen/harpoon",
    keys = function()
      return {
        {
          "<leader>ha",
          function()
            require("harpoon.mark").add_file()
          end,
          desc = "Add file (harpoon)",
        },
        {
          "<leader>ht",
          function()
            require("harpoon.ui").toggle_quick_menu()
          end,
          desc = "Toggle menu (harpoon)",
        },
        {
          "<leader>hj",
          function()
            require("harpoon.ui").nav_file(1)
          end,
          desc = "Go to file #1 (harpoon)",
        },
        {
          "<leader>hk",
          function()
            require("harpoon.ui").nav_file(2)
          end,
          desc = "Go to file #2 (harpoon)",
        },
        {
          "<leader>hl",
          function()
            require("harpoon.ui").nav_file(3)
          end,
          desc = "Go to file #3 (harpoon)",
        },
      }
    end,
    init = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>h"] = { name = "+harpoon" },
      })
    end,
  },

  {
    "mbbill/undotree",
    keys = {
      { "<C-z>", "<cmd>UndotreeToggle<CR>", desc = "toggle (undo tree)" },
    },
  },

  {
    "phaazon/mind.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "MindOpenMain",
      "MindOpenSmartProject",
    },
    keys = {
      {
        "<leader>Mm", "<cmd>MindOpenMain<CR>", desc = "Open main (Mind)"
      },
      {
        "<leader>mm", "<cmd>MindOpenSmartProject<CR>", desc = "Open smart project (Mind)"
      },
      {
        "<leader>mc",
        function()
          require("mind").wrap_smart_project_tree_fn(function(args)
            require("mind.commands").create_node_index(
              args.get_tree(),
              require("mind.node").MoveDir.INSIDE_END,
              args.save_tree,
              args.opts
            )
          end)
        end,
      },
      {
        "<leader>mi",
        function()
          vim.notify("initializing project tree")
          require("mind").wrap_smart_project_tree_fn(function(args)
            local tree = args.get_tree()
            local mind_node = require("mind.node")

            local _, tasks = mind_node.get_node_by_path(tree, "/Tasks", true)
            tasks.icon = "陼"

            local _, backlog = mind_node.get_node_by_path(tree, "/Tasks/Backlog", true)
            backlog.icon = " "

            local _, on_going = mind_node.get_node_by_path(tree, "/Tasks/On-going", true)
            on_going.icon = " "

            local _, done = mind_node.get_node_by_path(tree, "/Tasks/Done", true)
            done.icon = " "

            local _, cancelled = mind_node.get_node_by_path(tree, "/Tasks/Cancelled", true)
            cancelled.icon = " "

            local _, notes = mind_node.get_node_by_path(tree, "/Notes", true)
            notes.icon = " "

            args.save_tree()
          end)
        end,
      },
      --   {
      --     "<leader>Mc",
      --     function()
      --       require("mind").wrap_main_tree_fn(function(args)
      --         require("mind.commands").create_node_index(
      --           args.get_tree(),
      --           require("mind.node").MoveDir.INSIDE_END,
      --           args.save_tree,
      --           args.opts
      --         )
      --       end)
      --     end,
      --   },
      --   {
      --     "<leader>mi",
      --     function()
      --       vim.notify("initializing project tree")
      --       require("mind").wrap_smart_project_tree_fn(function(args)
      --         local tree = args.get_tree()
      --         local mind_node = require("mind.node")
      --
      --         local _, tasks = mind_node.get_node_by_path(tree, "/Tasks", true)
      --         tasks.icon = "陼"
      --
      --         local _, backlog = mind_node.get_node_by_path(tree, "/Tasks/Backlog", true)
      --         backlog.icon = " "
      --
      --         local _, on_going = mind_node.get_node_by_path(tree, "/Tasks/On-going", true)
      --         on_going.icon = " "
      --
      --         local _, done = mind_node.get_node_by_path(tree, "/Tasks/Done", true)
      --         done.icon = " "
      --
      --         local _, cancelled = mind_node.get_node_by_path(tree, "/Tasks/Cancelled", true)
      --         cancelled.icon = " "
      --
      --         local _, notes = mind_node.get_node_by_path(tree, "/Notes", true)
      --         notes.icon = " "
      --
      --         args.save_tree()
      --       end)
      --     end,
      --   },
      --   {
      --     "<leader>ml",
      --     function()
      --       require("mind").wrap_smart_project_tree_fn(function(args)
      --         require("mind.commands").copy_node_link_index(args.get_tree(), nil, args.opts)
      --       end)
      --     end,
      --   },
      --   {
      --     "<leader>Ml",
      --     function()
      --       require("mind").wrap_main_tree_fn(function(args)
      --         require("mind.commands").copy_node_link_index(args.get_tree(), nil, args.opts)
      --       end)
      --     end,
      --   },
      --   {
      --     "<leader>j",
      --     function()
      --       require("mind").wrap_main_tree_fn(function(args)
      --         local tree = args.get_tree()
      --         local path = vim.fn.strftime("/Journal/%Y/%b/%d")
      --         local _, node = require("mind.node").get_node_by_path(tree, path, true)
      --
      --         if node == nil then
      --           vim.notify("cannot open journal 🙁", vim.log.levels.WARN)
      --           return
      --         end
      --
      --         require("mind.commands").open_data(tree, node, args.data_dir, args.save_tree, args.opts)
      --         args.save_tree()
      --       end)
      --     end,
      --   },
      --   {
      --     "<leader>Mm",
      --     cmd = "MindOpenMain",
      --   },
      --   {
      --     "<leader>mm",
      --     cmd = "MindOpenSmartProject",
      --   },
      --   {
      --     "<leader>ms",
      --     function()
      --       require("mind").wrap_smart_project_tree_fn(function(args)
      --         require("mind.commands").open_data_index(args.get_tree(), args.data_dir, args.save_tree, args.opts)
      --       end)
      --     end,
      --   },
      --   {
      --     "<leader>Ms",
      --     function()
      --       require("mind").wrap_main_tree_fn(function(args)
      --         require("mind.commands").open_data_index(args.get_tree(), args.data_dir, args.save_tree, args.opts)
      --       end)
      --     end,
      --   },
    },
  },

  { "folke/twilight.nvim" },
  { "folke/zen-mode.nvim" },
}
