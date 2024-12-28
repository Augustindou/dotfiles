{ config, pkgs, ... }: {
      
    config = {
 
        networking = {
            hostName = config.user.description;
            networkmanager.enable = true;
            wireless.enable = false;
        };

        hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
        };
       
        environment.systemPackages = with pkgs; [
          networkmanager
        ];

    };
}
