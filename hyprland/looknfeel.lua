-- Change the default Omarchy look'n'feel.

hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 4,
		resize_on_border = true,
	},

	decoration = {
		rounding = 8,
	},
})

-- Remove gaps, borders, and rounding around a single tiled or maximized window.
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0, rounding = 0 })
