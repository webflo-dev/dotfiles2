return {
  --liangxianzhe/nap-nvim { "gbprod/stay-in-place.nvim" },

  -- {
  --   "liangxianzhe/nap-nvim",
  --   config = true,
  -- },


  { "brenoprata10/nvim-highlight-colors" },


  -- { "rebelot/terminal.nvim", },


  -- {
  --   "drybalka/tree-climber.nvim",
  --   init = function()
  --     local keyopts = { noremap = true, silent = true }
  --     vim.keymap.set({ 'n', 'v', 'o' }, 'H', require('tree-climber').goto_parent, keyopts)
  --     vim.keymap.set({ 'n', 'v', 'o' }, 'L', require('tree-climber').goto_child, keyopts)
  --     vim.keymap.set({ 'n', 'v', 'o' }, 'J', require('tree-climber').goto_next, keyopts)
  --     vim.keymap.set({ 'n', 'v', 'o' }, 'K', require('tree-climber').goto_prev, keyopts)
  --     vim.keymap.set({ 'v', 'o' }, 'in', require('tree-climber').select_node, keyopts, { desc = "select node" })
  --     vim.keymap.set('n', '<c-k>', require('tree-climber').swap_prev, keyopts)
  --     vim.keymap.set('n', '<c-j>', require('tree-climber').swap_next, keyopts)
  --     vim.keymap.set('n', '<c-h>', require('tree-climber').highlight_node, keyopts)
  --   end
  -- },

  {
    "james1236/backseat.nvim",
    opts = {
      openai_model_id = 'gpt-3.5-turbo', --gpt-4
    },
  },

  {
    "Bryley/neoai.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    -- keys = {
    --   { "<leader>as", desc = "summarize text" },
    --   { "<leader>ag", desc = "generate git message" },
    -- },
    opts = function()
      return {
        ui = {
          output_popup_text = "NeoAI",
          input_popup_text = "Prompt",
          width = 30,             -- As percentage eg. 30%
          output_popup_height = 80, -- As percentage eg. 80%
        },
        model = "gpt-3.5-turbo",
        register_output = {
          ["g"] = function(output)
            return output
          end,
          ["c"] = require("neoai.utils").extract_code_snippets,
        },
        inject = {
          cutoff_width = 75,
        },
        prompts = {
          context_prompt = function(context)
            return "Hi ChatGPT, I'd like to provide some context for future "
                .. "messages. Here is the code/text that I want to refer "
                .. "to in our upcoming conversations:\n\n"
                .. context
          end,
        },
        open_api_key_env = "OPENAI_API_KEY",
        shortcuts = {
          {
            key = "<leader>as",
            use_context = true,
            prompt = [[
                Please rewrite the text to make it more readable, clear,
                concise, and fix any grammatical, punctuation, or spelling
                errors
            ]],
            modes = { "v" },
            strip_function = nil,
          },
          {
            key = "<leader>ag",
            use_context = false,
            prompt = function()
              return [[
                    Using the following git diff generate a consise and
                    clear git commit message, with a short title summary
                    that is 75 characters or less:
                ]] .. vim.fn.system("git diff --cached")
            end,
            modes = { "n" },
            strip_function = nil,
          },
        }
      }
    end,
  }
}
