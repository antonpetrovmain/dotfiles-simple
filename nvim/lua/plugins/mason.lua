return { 
	{ "mason-org/mason.nvim", cmd = "Mason", opts = {} },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = {
    ensure_installed = {  'lua-language-server',   'basedpyright', 'java-language-server'},

  }},

}
