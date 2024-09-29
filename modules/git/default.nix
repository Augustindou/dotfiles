{lib, config, pkgs, ...}: 
let 
    cfg = config.git;
    userCfg = config.user;
in {
    options.git = {
        enable = lib.mkEnableOption "Enable git & set username and email";
    };

    config = lib.mkIf cfg.enable {
        home-manager.users.${userCfg.username}.programs.git = {
            enable = true;
            userEmail = userCfg.email;
            userName = userCfg.name;
        };
    };
}