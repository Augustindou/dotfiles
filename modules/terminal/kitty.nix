{lib, config, pkgs, ...}: 
let 
    userCfg = config.user;
    cfg = config.terminal.kitty;
in {
    options.terminal.kitty = {
        enable = lib.mkEnableOption "Enable kitty";
    };

    config = lib.mkIf cfg.enable {
        home-manager.users.${userCfg.username} = {
            programs.kitty.enable = true;
            programs.kitty.extraConfig = ''
                font_size 20
            '';
        };

        environment.systemPackages = with pkgs; [
            kitty
        ];
    };
}