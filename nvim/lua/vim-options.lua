
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = 'Open explorer' })
vim.keymap.set("n", "<leader>qs", vim.cmd.w, { desc = 'Save file' })
vim.keymap.set("n", "<leader>qq", vim.cmd.q, { desc = 'Quit file' })

vim.keymap.set("n", "<leader>wv", "<C-w><C-v>", { desc = 'Vertical split' })
vim.keymap.set("n", "<leader>ws", "<C-w><C-s>", { desc = 'Horizontal split' })
vim.keymap.set("n", "<leader>wq", "<C-w><C-q>", { desc = 'Close window' })
vim.keymap.set("n", "<leader>wl", "<C-w><C-l>", { desc = 'Move left window' })
vim.keymap.set("n", "<leader>wh", "<C-w><C-h>", { desc = 'Move right window' })
vim.keymap.set("n", "<leader>wj", "<C-w><C-j>", { desc = 'Move down window' })
vim.keymap.set("n", "<leader>wk", "<C-w><C-k>", { desc = 'Move up window' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = 'Copy selected to clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'Copy line to clipboard' })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>if", "mzgg=G'z", { desc = 'Indent file' })

vim.keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Substitute word' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, { desc = 'Make file executable' })

-- markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { desc = 'Markdown Preview' })

-- Map <Leader>n to run the create_note.sh script
--vim.api.nvim_set_keymap('n', '<Leader>nt', ':terminal sh ~/github_EzLucca/Dotfiles/scripts/template.sh<CR>', { noremap = true, silent = true })

-- Prompt for book title and author, then run the script with those arguments
--vim.api.nvim_set_keymap('n', '<Leader>nt', ':lua RunCreateNote()<CR>', { noremap = true, silent = true })
--
--function RunCreateNote()
--    -- Pede ao usuário o título do livro e o autor
--    local book_title = vim.fn.input("Título do Livro: ")
--    local author = vim.fn.input("Autor: ")
--
--    -- Executa o script e captura a saída (nome do arquivo)
--    local handle = io.popen(string.format('sh /home/duds/github_EzLucca/Dotfiles/scripts/template.sh "%s" "%s"', book_title, author))
--    local filename = handle:read("*a")
--    handle:close()
--
--    -- Remove espaços ou novas linhas extras
--    filename = vim.fn.trim(filename)
--
--    -- Debug: Exibe o nome do arquivo
--    print("Nome do arquivo criado: " .. filename)
--
--    -- Verifica se o arquivo foi criado com sucesso e abre-o
--    if vim.fn.filereadable(filename) == 1 then
--        vim.cmd('edit ' .. vim.fn.fnameescape(filename))
--    else
--        print("Erro: Falha ao abrir o arquivo de nota: " .. filename)
--    end
--end
--
--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)

