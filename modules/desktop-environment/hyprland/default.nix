{ lib, config, pkgs, inputs, ... }:
let
  userCfg = config.user;
  cfg = config.hyprland;
in
{
  options.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland desktop environment";
  };

  imports = [
    ./hyprlock
    ./hyprpaper
    ./waybar
    ./swaync
    ./wlogout
    ./wofi
  ];

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;

    hyprlock.enable = true;
    hyprpaper.enable = true;
    waybar.enable = true;
    swaync.enable = true;
    wlogout.enable = true;
    wofi.enable = true;

    # autologin to use hyprlock directly afterwards
    services.displayManager.autoLogin = {
      enable = true;
      user = userCfg.username;
    };

    home-manager.users.${userCfg.username} = {
      wayland.windowManager.hyprland = {
        enable = true;
        extraConfig = builtins.readFile ./hyprland.conf;
      };
    };

    environment.systemPackages = with pkgs; [
      kitty # terminal
      nautilus # file explorer
      bluetuith # bluetooth TUI
      hyprshot # screenshots
      obs-studio # record screen
      pamixer # audio + / - / mute
      playerctl # audio next / previous / pause
      vlc # video
      udiskie # mount disks automatically

      # cursors
      hyprcursor
      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

      # screensharing 
      pipewire
      wireplumber
    ];
  };
}
