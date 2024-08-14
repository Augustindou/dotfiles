{ config, pkgs, inputs, ... }:

{
  # ---------------------------------------------------------------------------
  # users
  # ---------------------------------------------------------------------------

  programs.git = {
    enable = true;
    userEmail = "augustin.doultremontao@gmail.com";
    userName = "augustindou";
  };
}
