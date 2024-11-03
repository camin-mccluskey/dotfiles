return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = require("camin.utils.colors")

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.pine, fg = colors.base, gui = "bold" },
				b = { bg = colors.base, fg = colors.text },
				c = { bg = colors.base, fg = colors.text },
			},
			insert = {
				a = { bg = colors.rose, fg = colors.base, gui = "bold" },
				b = { bg = colors.base, fg = colors.text },
				c = { bg = colors.base, fg = colors.text },
			},
			visual = {
				a = { bg = colors.gold, fg = colors.base, gui = "bold" },
				b = { bg = colors.base, fg = colors.text },
				c = { bg = colors.base, fg = colors.text },
			},
			command = {
				a = { bg = colors.iris, fg = colors.base, gui = "bold" },
				b = { bg = colors.base, fg = colors.text },
				c = { bg = colors.base, fg = colors.text },
			},
			replace = {
				a = { bg = colors.love, fg = colors.base, gui = "bold" },
				b = { bg = colors.base, fg = colors.text },
				c = { bg = colors.base, fg = colors.text },
			},
			inactive = {
				a = { bg = colors.muted, fg = colors.highlight_low, gui = "bold" },
				b = { bg = colors.muted, fg = colors.highlight_low },
				c = { bg = colors.muted, fg = colors.highlight_low },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = my_lualine_theme,
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
