{
  services.xserver.xkb = {
    extraLayouts.belgian-mac-custom = {
      description  = "Custom mac-like keyboard";
      languages    = [ "eng" ];
      keycodesFile = ./keycodes;
      symbolsFile  = ./symbols;
    };

    layout = "belgian-mac-custom";
    variant = "default";
  };
}