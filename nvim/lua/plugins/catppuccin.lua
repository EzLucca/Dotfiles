
return { 
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end
  }
}

-- vim.cmd("highlight Pmenu      ctermfg=white ctermbg=darkgray ")
-- vim.cmd("highlight PmenuSel   ctermfg=black ctermbg=lightgray ")
--
-- vim.cmd("highlight VertSplit cterm=NONE ctermfg=black ctermbg=NONE")
-- vim.cmd("highlight Normal guibg=#343541 guifg=#d4d4d4")
--
-- -- Muted green color: #6A9B58 or #4C8C43 (you can tweak it)
-- vim.cmd("highlight Function  ctermfg=65")
-- vim.cmd("highlight Type      ctermfg=65")
-- vim.cmd("highlight Special   ctermfg=65")
-- vim.cmd("highlight PreProc   ctermfg=65")
-- vim.cmd("highlight Comment 	ctermfg=240")
-- vim.cmd("highlight LineNr 	ctermfg=240")
-- vim.cmd("highlight Statement ctermfg=130")
-- vim.cmd("highlight vimvar 	ctermfg=140")
-- vim.cmd("highlight netrwDir 	ctermfg=140")
-- vim.cmd("highlight normal 	ctermfg=250")
--
-- -- Status line: dark bg with muted green fg
-- vim.cmd("highlight StatusLine   ctermfg=65 ctermbg=234")
-- -- Status line inactive (for split windows)
-- vim.cmd("highlight StatusLineNC ctermfg=240 ctermbg=234")
--
-- Setting highlights in Neovim (Lua configuration)
-- vim.api.nvim_set_hl(0, 'Function', { ctermfg = 65, guifg = '#6A9B58' })
-- vim.api.nvim_set_hl(0, 'Type', { ctermfg = 65, guifg = '#6A9B58' })
-- vim.api.nvim_set_hl(0, 'Special', { ctermfg = 65, guifg = '#6A9B58' })
-- vim.api.nvim_set_hl(0, 'PreProc', { ctermfg = 65, guifg = '#6A9B58' })
-- vim.api.nvim_set_hl(0, 'Comment', { ctermfg = 240, guifg = '#a0a0a0' })
-- vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = 240, guifg = '#a0a0a0' })
-- vim.api.nvim_set_hl(0, 'Statement', { ctermfg = 130, guifg = '#FF6A00' })
-- vim.api.nvim_set_hl(0, 'vimvar', { ctermfg = 140, guifg = '#B5E61D' })
-- vim.api.nvim_set_hl(0, 'netrwDir', { ctermfg = 140, guifg = '#B5E61D' })
-- vim.api.nvim_set_hl(0, 'Normal', { ctermfg = 250, guifg = '#D4D4D4', guibg = '#343541' })
--
