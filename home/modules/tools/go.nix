{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.tools.go;

in {
  options.tools.go = {
    enable = mkEnableOption "Enable Go toolchain";

    enableGopls = mkEnableOption "Install gopls (Go language server)" // {
      default = true;
    };

    enableLint = mkEnableOption "Install golangci-lint" // {
      default = true;
    };

    enableDlv = mkEnableOption "Install delve debugger (dlv)" // {
      default = true;
    };

    gopath = mkOption {
      type = types.str;
      default = "$HOME/go";
      description = "GOPATH to use for user builds";
    };

    goToolchain = mkOption {
      type = types.str;
      default = "local"; # prevent auto-downloads; use Nix-provided toolchain
      description = "Value for GOTOOLCHAIN environment variable (e.g., 'local', 'auto')";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.go
    ]
    ++ (optional cfg.enableGopls pkgs.gopls)
    ++ (optional cfg.enableLint pkgs.golangci-lint)
    ++ (optional cfg.enableDlv pkgs.delve);

    home.sessionVariables = {
      GOPATH = cfg.gopath;
      GOTOOLCHAIN = cfg.goToolchain;
    };

    home.sessionPath = [
      "${cfg.gopath}/bin"
    ];
  };
}
