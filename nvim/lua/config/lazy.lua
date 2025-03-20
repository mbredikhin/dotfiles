-- Basic lazy.nvim setup as copied from the readme
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {{
        import = "plugins"
    }},
    install = {
        colorscheme = {"melange"}
    },
    checker = {
        enabled = true,
        notify = false
    }
})

require("config.keymaps").init()

vim.opt.number = true
vim.opt.termguicolors = true
vim.cmd.colorscheme "melange"
