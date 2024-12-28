{ lib, config, ... }: {
    options.git.enable = lib.mkEnableOption "Enable git & set username and email";
   
    config = lib.mkIf config.git.enable {
        programs.git = {
            enable = true;
            userEmail = config.user.email;
            userName = config.user.name;
        };
    };
}  
