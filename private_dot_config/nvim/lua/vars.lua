--[[ vars.lua ]]

local g = vim.g
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Update the packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path
