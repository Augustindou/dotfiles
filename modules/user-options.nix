{ lib, config, ... }:
let
  cfg = config.user;
in
{
  options.user = {
    username = lib.mkOption {
      type = lib.types.str;
      description = "Username (used in path & other places)";
    };

    name = lib.mkOption {
      type = lib.types.str;
      description = "Name";
      default = cfg.username;
    };

    email = lib.mkOption {
      type = lib.types.str;
      description = "Email (used for git)";
    };

    description = lib.mkOption {
      type = lib.types.str;
      description = "Description";
      default = "";
    };
  };
}
