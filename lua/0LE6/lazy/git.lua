return {
	-- Neogit: full Git UI like VSCode's source control
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = function()
			require("neogit").setup({
				integrations = {
					diffview = true,
				},
			})
		end,
		keys = {
			{ "<leader>gg", "<cmd>Neogit<CR>", desc = "Open Neogit" },
		},
	},

	-- Diffview: side-by-side diffs (for commits, changes, history)
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
	},

	-- Gitsigns: inline git indicators and hunk actions
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
}

