{ lib, config, pkgs, inputs, ... }:
let
  cfg = config.hyprland;
in
{
    options.hyprland.enable = lib.mkEnableOption "Enable Hyprland desktop environment";
 
    imports = [
        ./hyprlock
        ./waybar
        ./swaync
        ./wlogout
        ./wofi

        ./hyprpaper.nix
    ];
 
    config = lib.mkIf cfg.enable {
        hyprlock.enable = true;
        hyprpaper.enable = true;
        waybar.enable = true;
        swaync.enable = true;
        wlogout.enable = true;
        wofi.enable = true;
      
        wayland.windowManager.hyprland = {
            enable = true;
            extraConfig = builtins.readFile ./hyprland.conf;
        };
      
        home.packages = with pkgs; [
            kitty # terminal
            nautilus # file explorer
            bluetuith # bluetooth TUI
            hyprshot # screenshots
            obs-studio # record screen
            pamixer # audio + / - / mute
            playerctl # audio next / previous / pause
            vlc # video
            udiskie # mount disks automatically
            wl-clipboard-rs # copy from terminal
            swappy # image viewer & editor
        
            # cursors
            hyprcursor
            inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
        
            # screensharing 
            pipewire
            wireplumber
        ];
    };
}
