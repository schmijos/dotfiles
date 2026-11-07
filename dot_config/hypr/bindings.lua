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

-- o.bind("MOD5 + A", nil, "wtype ä")
-- o.bind("MOD5 + O", nil, "wtype ö")
-- o.bind("MOD5 + U", nil, "wtype ü")
-- o.bind("MOD5 + SHIFT + A", nil, "wtype Ä")
-- o.bind("MOD5 + SHIFT + O", nil, "wtype Ö")
-- o.bind("MOD5 + SHIFT + U", nil, "wtype Ü")


-- altgr-intl has no ellipsis (AltGr + . is a dead key there), so type one directly.
-- o.bind("MOD5 + PERIOD", "Type ellipsis", "wtype …")

-- Jump to start/end of line in any app. MOD5 is AltGr: right Alt on the
-- laptop, right Cmd on the Magic Keyboard (see input.lua).
o.bind("MOD5 + LEFT", "Jump to start of line", hl.dsp.send_shortcut({ mods = "", key = "Home" }))
o.bind("MOD5 + RIGHT", "Jump to end of line", hl.dsp.send_shortcut({ mods = "", key = "End" }))

-- Dictation keys from before Alt + Space and Right Alt became the defaults.
-- Remove these lines to give the keys back to applications.
if o.dictation_installed and o.dictation_installed() then
  o.bind("SUPER + CTRL + X", "Toggle dictation", "omarchy-dictation toggle")
  o.bind_hold("F9", "Start dictation (push-to-talk)", "omarchy-dictation start", "Stop dictation (push-to-talk)", "omarchy-dictation stop")
end
