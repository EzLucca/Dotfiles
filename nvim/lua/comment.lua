local ts_utils = require('nvim-treesitter.ts_utils')

local function get_comment_syntax()
  local ft = vim.bo.filetype
  local map = {
    c = { "#if 0", "#endif" },
    cpp = { "#if 0", "#endif" },
    python = { '"""', '"""' },
    lua = { "--[[", "--]]" },
    javascript = { "/*", "*/" },
    typescript = { "/*", "*/" },
    java = { "/*", "*/" },
  }
  return map[ft] or { "// #if 0", "// #endif" } -- default fallback
end

function CommentOutFunction()
  local node = ts_utils.get_node_at_cursor()
  if not node then
    print("No Treesitter node found at cursor.")
    return
  end

  -- Find the enclosing function node
  while node do
    local type = node:type()
    if type:match("function") or type:match("function_definition") or type:match("method") then
      break
    end
    node = node:parent()
  end

  if not node then
    print("No enclosing function found.")
    return
  end

  local start_row, _, end_row, _ = node:range()
  local comment_start, comment_end = unpack(get_comment_syntax())

  -- Insert comment block
  vim.api.nvim_buf_set_lines(0, start_row, start_row, false, { comment_start })
  vim.api.nvim_buf_set_lines(0, end_row + 2, end_row + 2, false, { comment_end })

  print("Function commented with block comments.")
end

vim.keymap.set("n", "<leader>cf", CommentOutFunction, { desc = "Comment out function" })
