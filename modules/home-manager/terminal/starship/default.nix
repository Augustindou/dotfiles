{ lib, config, ... }: {

    options.terminal.starship.enable = lib.mkEnableOption "Enable starship";
 
    config = lib.mkIf config.terminal.starship.enable {
        programs.starship = {
            enable = true;
            settings = builtins.fromTOML (builtins.readFile ./starship.toml);
        };
    };
}
