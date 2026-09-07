local seed = "[workspace special:scratchpad2 silent] omarchy-launch-terminal"

hl.config({
	decoration = {
		dim_special = 0.6,
	},
})

hl.window_rule({
	match = { workspace = "special:scratchpad" },
	float = true,
	center = true,
	size = { "(monitor_w * 3 / 5)", "(monitor_h * 3 / 5)" },
})

local function layout()
	hl.workspace_rule({
		workspace = "special:scratchpad",
		gaps_in = 4,
		gaps_out = { top = 4, right = 4, bottom = 4, left = 4 },
		no_border = false,
		on_created_empty = seed,
	})
end

local function resize(monitor)
	-- Window geometry is logical pixels, not physical monitor pixels.
	local width = math.floor(monitor.width / monitor.scale * 3 / 5)
	local height = math.floor(monitor.height / monitor.scale * 3 / 5)

	for _, window in ipairs(hl.get_workspace_windows("special:scratchpad")) do
		hl.dispatch(hl.dsp.window.resize({ window = window, x = width, y = height }))
		hl.dispatch(hl.dsp.window.center({ window = window }))
	end
end

-- Until a monitor can be read, cover the whole work area rather than leaving
-- the console unruled, so it is never seeded without its placement.
layout()
hl.on("monitor.layout_changed", layout)
hl.on("monitor.focused", layout)

hl.on("workspace.special_active", function(workspace, monitor)
	if workspace.name == "special:scratchpad" then
		resize(monitor)
	end
end)

-- The direction names the edge the offset is measured from, not where the
-- workspace goes: "slide top" drops it down into view, and "slide bottom"
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slide top" })
hl.animation({
	leaf = "specialWorkspaceOut",
	enabled = true,
	speed = 2,
	bezier = "easeInOutCubic",
	style = "slide bottom",
})
