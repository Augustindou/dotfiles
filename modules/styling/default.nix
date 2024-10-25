{lib, config, pkgs, inputs, ...}: 
let 
    userCfg = config.user;
in {
    config.home-manager.users.${userCfg.username} = {
        home.pointerCursor = {
            name = "BreezeX-RosePine-Linux";
            package = pkgs.rose-pine-cursor;
            size = 24;
            gtk.enable = true;
            x11.enable = true;
            x11.defaultCursor = true;
        };

        imports = [
            inputs.catppuccin.homeManagerModules.catppuccin
        ];

        catppuccin = {
            enable = true;
            flavor = "mocha";
        };

        gtk = {
            enable = true;

            cursorTheme = { 
                name = "rose-pine-cursor";
                package = pkgs.rose-pine-cursor;
                size = 24;
            };

            theme = {
                name = "catppuccin-macchiato-mauve-compact";
                package = pkgs.catppuccin-gtk.override {
                    accents = ["mauve"];
                    variant = "macchiato";
                    size = "compact";
                };
            };
            gtk3.extraConfig.settings = ''
                gtk-application-prefer-dark-theme=1
            '';
            gtk4.extraConfig.settings = ''
                gtk-application-prefer-dark-theme=1
            '';
        };
    };
}