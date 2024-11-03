local function find_config(bufnr, config_files)
	return vim.fs.find(config_files, {
		upward = true,
		stop = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
		path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
	})[1]
end

local function biome_or_prettier(bufnr)
	local has_biome_config = find_config(bufnr, { "biome.json", "biome.jsonc" })
	if has_biome_config then
		return { "biome", stop_after_first = true }
	end

	local has_prettier_config = find_config(bufnr, {
		".prettierrc",
		".prettierrc.json",
		".prettierrc.yml",
		".prettierrc.yaml",
		".prettierrc.json5",
		".prettierrc.js",
		".prettierrc.cjs",
		".prettierrc.toml",
		"prettier.config.js",
		"prettier.config.cjs",
	})
	if has_prettier_config then
		return { "prettierd", "prettier", stop_after_first = true }
	end

	-- Default to Prettier if no config is found
	return { "prettierd", "prettier", stop_after_first = true }
end

local filetypes_with_dynamic_formatter = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"vue",
	"css",
	"scss",
	"less",
	"html",
	"json",
	"jsonc",
	"yaml",
	"markdown",
	"markdown.mdx",
	"graphql",
	"handlebars",
}

local filetypes_with_static_formatter = {
	lua = { "stylua" },
	python = { "black" },
	golang = { "gofmt" },
}

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = (function()
				local result = {}
				for _, ft in ipairs(filetypes_with_dynamic_formatter) do
					result[ft] = biome_or_prettier
				end
				for ft, formatters in pairs(filetypes_with_static_formatter) do
					result[ft] = formatters
				end
				return result
			end)(),
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		},
	},
}
