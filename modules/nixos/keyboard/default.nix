{ lib, config, pkgs, ... }: {

    # options
    options.keyboard.macKeyboard.enable = lib.mkEnableOption "Enable keyboard modifications similar to mac";

    config = lib.mkMerge [

        ({
            # default config
            services.xserver.xkb.layout = "be";
            console.useXkbConfig = true;

            # Keyboard repeat delay & interval
            services.xserver.autoRepeatDelay = 250;
            services.xserver.autoRepeatInterval = 30;
        })

        (lib.mkIf config.keyboard.macKeyboard.enable {
            # Keyd remaps
            services.keyd = {
                enable = true;
                keyboards.default = {
                    ids = [ "*" ];
                    extraConfig = builtins.readFile ./mac-keyboard.conf;
                };
            };
            
            environment.systemPackages = with pkgs; [
                keyd
            ];
        })

    ];
}
