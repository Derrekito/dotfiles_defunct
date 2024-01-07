local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("i", "<C-c>", "<Esc>")

keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- In Visual mode, replace the selected text with the last yanked text.
-- This binding uses the "black hole" register "_" to delete "d" the selected
-- text without affecting the clipboard or other registers, then pastes "P" the
-- previously yanked text in its place. Useful for quick text swaps.
keymap.set("x", "<leader>p", [["_dP]])

-- Map <leader>y to copy the current line (in Normal mode) or the selected text
-- (in Visual mode) directly to the system clipboard. This keymap utilizes the
-- "+ register, which is Vim's way of accessing the system clipboard. It allows
-- for easy copying of text from Vim to other applications outside of Vim.
keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- In Normal mode, map <leader>Y to copy from the cursor position to the end of
-- the line directly to the system clipboard. This uses the "+ register, which
-- allows for interaction with the system clipboard, facilitating text transfer
-- from Vim to external applications.
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({"n", "v"}, "<leader>d", [["_d]])


keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap.set("n", "<leader>f", vim.lsp.buf.format)

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Select All
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split Window
keymap.set("n", "<leader>-", ":split<Return>", opts)
keymap.set("n", "<leader>|", ":vsplit<Return>", opts)

-- Move Window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize Window
keymap.set("n", "<C-left>", "<C-w><")
keymap.set("n", "<C-right>", "<C-w>>")
keymap.set("n", "<C-up>", "<C-w>+")
keymap.set("n", "<C-down>", "<C-w>-")
