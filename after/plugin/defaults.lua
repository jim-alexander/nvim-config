-- Folder Directory
vim.keymap.set('n', '<leader>fd', vim.cmd.Ex, { desc = "[f]ile [d]irectory" })

-- Moves the selected vines UP / DOWN
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When paging UP and DOWN this keeps the cursor in the middle of the page
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- When toggling through searched words, this ensures they are center of the page
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copys to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Replace the word that my cursor is on (For all instances)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- This unsets the "last search pattern" register by hitting return
vim.keymap.set("n", "<CR>", function() vim.cmd.noh() end)

-- Add console.log() and put cursor inside it
vim.keymap.set("i", "cll", "console.log()<Esc><S-f>(a")

-- Adds a line underneath with padding!
vim.keymap.set("n", "<leader>o", "<Esc>o<c-return><c-return><Esc>ki")

-- Prettier
vim.g["prettier#autoformat"] = 1
vim.g["prettier#config#semi"] = false
vim.g["prettier#config#print_width"] = 120
vim.g["prettier#config#trailing_comma"] = "all"
vim.g["prettier#config#shift_width"] = 4

-- Hmm not really working reliably for some reason
vim.keymap.set({ "n", "i" }, "Ï", function() vim.cmd("PrettierAsync") end)
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = vim.api.nvim_create_augroup("PrettierAutoFormat", { clear = true }),
  pattern = { "*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html" },
  callback = function()
    vim.cmd('PrettierAsync')
    print("Formatted file with prettier.")
  end,
})
