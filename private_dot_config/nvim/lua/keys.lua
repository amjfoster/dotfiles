--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

map('n', 'ff', [[:Telescope find_files]], {})
