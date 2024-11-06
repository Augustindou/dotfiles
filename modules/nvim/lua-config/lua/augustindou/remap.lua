-- Based on ThePrimeagen

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle when jumping or searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep yanked word when pasting over text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete without overriding yanked value
vim.keymap.set("n", "<leader>d", [["_d]])
vim.keymap.set("v", "<leader>d", [["_d]])

-- Yank to clipboard (asbjornHaland)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Other
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)
