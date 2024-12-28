{ lib, config, pkgs, ... }: {

    options.terminal.zsh.enable = lib.mkEnableOption "Enable zsh";
 
    config = lib.mkIf config.terminal.zsh.enable {
        programs.zsh.enable = true;
        users.defaultUserShell = pkgs.zsh;
    };
}
