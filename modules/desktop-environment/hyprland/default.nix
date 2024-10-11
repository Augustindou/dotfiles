{lib, config, pkgs, ...}: 
let 
    userCfg = config.user;
    cfg = config.hyprland;
in {
    options.hyprland = {
        enable = lib.mkEnableOption "Enable Hyprland desktop environment";
    };

    imports = [
        ./hyprlock
    ];

    config = lib.mkIf cfg.enable {
        programs.hyprland.enable = true;

        # sub modules
        hyprlock.enable = true;

        home-manager.users.${userCfg.username} = {
            wayland.windowManager.hyprland = {
                enable = true;
                extraConfig = builtins.readFile ./hyprland.conf;
            };

            programs.waybar = {
                enable = true;
                settings.mainBar = lib.importJSON ./waybar/config.jsonc;
                style = builtins.readFile ./waybar/style.css;
            };

            # fonts for icons
            fonts.fontconfig.enable = true;
            home.packages = with pkgs; [
                fira-code
                fira-code-symbols
                font-awesome
                liberation_ttf
                mplus-outline-fonts.githubRelease
                nerdfonts
                noto-fonts
                noto-fonts-emoji
                proggyfonts
            ];
        };

        environment.systemPackages = with pkgs; [
            kitty # terminal
            wofi # app launcher
            kdePackages.dolphin # file explorer
            waybar # menu bar
            bluetuith # bluetooth TUI
            hyprshot # screenshots
            pamixer # audio + / - / mute

            # screensharing 
            pipewire
            wireplumber
        ];
    };
}