-- Extra autostart processes.
-- o.launch_on_start("my-service")

hl.on("hyprland.start", function()
	hl.exec_cmd(o.launch("zen-browser"), { workspace = "1 silent" })
	hl.exec_cmd(o.launch("$TERMINAL"), { workspace = "2 silent" })
	hl.exec_cmd(o.launch("spotify"), { workspace = "9 silent" })
end)
