-- Set up nvim-cmp.
local cmp = require("cmp")

--local t = function(str)
--	return vim.api.nvim_replace_termcodes(str, true, true, true)
--end

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			--vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {

		-- ... Your other configuration ...

		["<C-Space>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),

		["<Tab>"] = function(fallback)
			if not cmp.select_next_item() then
				if vim.bo.buftype ~= "prompt" and has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end
		end,

		["<S-Tab>"] = function(fallback)
			if not cmp.select_prev_item() then
				if vim.bo.buftype ~= "prompt" and has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end
		end,
	},

	snippet = {
		-- We recommend using *actual* snippet engine.
		-- It's a simple implementation so it might not work in some of the cases.
		expand = function(args)
			unpack = unpack or table.unpack
			local line_num, col = unpack(vim.api.nvim_win_get_cursor(0))
			local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
			local indent = string.match(line_text, "^%s*")
			local replace = vim.split(args.body, "\n", true)
			local surround = string.match(line_text, "%S.*") or ""
			local surround_end = surround:sub(col)

			replace[1] = surround:sub(0, col - 1) .. replace[1]
			replace[#replace] = replace[#replace] .. (#surround_end > 1 and " " or "") .. surround_end
			if indent ~= "" then
				for i, line in ipairs(replace) do
					replace[i] = indent .. line
				end
			end

			vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, replace)
		end,
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
)
equire("cmp_git").setup() ]]
--

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local lsp_servers = {
	"bashls",
	"clangd",
	"docker_compose_language_service",
	"dockerls",
	"html",
	"kotlin_language_server",
	"lua_ls",
	"phpactor",
	"pylsp",
	"pyright",
	"ts_ls",
}
for i, s in pairs(lsp_servers) do
	require("lspconfig")[s].setup({
		capabilities = capabilities,
	})
end
