-- Print a message to confirm the LaTeX configuration is loaded

-- Configure Neovim to use spaces instead of tabs for LaTeX files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  callback = function()
    vim.bo.expandtab = true -- Use spaces instead of tabs
    vim.bo.shiftwidth = 2 -- Number of spaces for each indentation level
    vim.bo.softtabstop = 2 -- Number of spaces per Tab key press
  end,
})
