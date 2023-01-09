function ColorMyPencils(color)
	color = color or "gruvbox-flat"
    vim.g.gruvbox_flat_style = "dark"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
