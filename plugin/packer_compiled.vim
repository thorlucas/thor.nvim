" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/thorcorreia/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/thorcorreia/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/thorcorreia/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/thorcorreia/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/thorcorreia/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["ayu-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/ayu-vim"
  },
  ["coc.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/coc.nvim"
  },
  ["goyo.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  nerdcommenter = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/nerdcommenter"
  },
  ["nvim-luadev"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/nvim-luadev"
  },
  ["nvim-tree.lua"] = {
    after = { "nvim-web-devicons" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    load_after = {
      ["nvim-tree.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["riscv.vim"] = {
    loaded = true,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/start/riscv.vim"
  },
  ["telescope-project.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    after = { "plenary.nvim", "popup.nvim" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ultisnips = {
    after_files = { "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/ultisnips/after/plugin/UltiSnips_after.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/ultisnips"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  vimwiki = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/thorcorreia/.local/share/nvim/site/pack/packer/opt/vimwiki"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
