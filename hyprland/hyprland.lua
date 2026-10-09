-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Omarchy 4.0 ships its own scratchpad (default/hypr/qconsole.lua). It claims
-- special:scratchpad and rewrites that workspace rule from window.open,
-- window.destroy, window.move_to_workspace and window.update_rules, none of
-- which hypr/scratchpad.lua hooks, so it always gets the last word. There is no
-- opt-out flag and hl has no way to unregister a handler, so mark the module
-- loaded before Omarchy's defaults require it: require() skips it entirely and
-- hypr/scratchpad.lua owns the workspace.
package.loaded["default.hypr.qconsole"] = true

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })
require("hypr.scratchpad")
