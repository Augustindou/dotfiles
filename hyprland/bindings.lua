-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Personal shortcuts migrated from the pre-Quattro configuration.
o.bind("ALT + SPACE", "Omarchy menu", "omarchy-menu toggle")
hl.unbind("SUPER + SHIFT + O")
o.bind("SUPER + SHIFT + O", "Clipboard history", "omarchy-shell shell toggle omarchy.clipboard")
o.bind("ALT + SHIFT + O", "Clipboard history", "omarchy-shell shell toggle omarchy.clipboard")
o.bind("CTRL + ALT + SPACE", "Emojis", "omarchy-shell shell toggle omarchy.emojis")

o.bind("ALT + SHIFT + code:13", "Screenshot", "omarchy-capture-screenshot")
o.bind("ALT + SHIFT + code:14", "Capture menu", "omarchy-menu toggle capture")

o.bind("CTRL + SHIFT + SPACE", "1Password Quick Access", "1password --quick-access")
o.bind("ALT + SHIFT + SPACE", "1Password Quick Access", "1password --quick-access")

hl.unbind("SUPER + W")
hl.unbind("SUPER + SHIFT + W")
hl.unbind("CTRL + ALT + DELETE")
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())
o.bind("ALT + Q", "Close window", hl.dsp.window.close())

hl.unbind("SUPER + TAB")
o.bind("SUPER + TAB", "Former workspace", hl.dsp.focus({ workspace = "previous" }))
