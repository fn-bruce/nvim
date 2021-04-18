-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
		"bash",
		"c",
		"css",
		"html",
		"javascript",
		"json",
		"latex",
		"lua",
		"php",
		"python",
		"regex",
		"scss",
		"yaml",
  },
  highlight = {
    enable = true,
  },
}
