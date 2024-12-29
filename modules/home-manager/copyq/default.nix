{ lib, config, ... }: {
    options.copyq.enable = lib.mkEnableOption "Enable CopyQ clipboard history";
   
    config = lib.mkIf config.copyq.enable {
        services.copyq = {
            enable = true;
        };

        home.file.".config/copyq/copyq.conf".source = config.lib.file.mkOutOfStoreSymlink 
            "${config.home.homeDirectory}/.config/nixos-config/modules/home-manager/copyq/copyq.conf";
    };
}  
