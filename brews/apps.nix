{ config, lib, pkgs, ... }:

{
  brews.apps = {
    casks = [
      "1password"
      "jetbrains-toolbox"
      "postman"
      "shottr" # screenshot tool
      "slack"
    ];
    brews = [
      "gh" # GitHub CLI
      "gemini-cli"
    ];
  };

  brews.vscode = {
    enable = true;
    extensions = [
        "amazonwebservices.aws-toolkit-vscode"
        "arrterian.nix-env-selector"
        "authzed.spicedb-vscode"
        "bbenoist.Nix"
        "bierner.markdown-mermaid"
        "coolbear.systemd-unit-file"
        "donjayamanne.githistory"
        "eamodio.gitlens"
        "giltho.comby-vscode"
        "GitHub.copilot"
        "GraphQL.vscode-graphql-syntax"
        "GraphQL.vscode-graphql"
        "hashicorp.terraform"
        "haskell.haskell"
        "Ionide.Ionide-fsharp"
        "jnoortheen.nix-ide"
        "JozefChmelar.compare"
        "justusadam.language-haskell"
        "kmoritak.vscode-mermaid-snippets"
        "ms-azuretools.vscode-docker"
        "ms-dotnettools.csdevkit"
        "ms-dotnettools.csharp"
        "ms-dotnettools.vscode-dotnet-runtime"
        "ms-dotnettools.vscodeintellicode-csharp"
        "ms-vscode-remote.remote-containers"
        "ms-vscode.makefile-tools"
        "PKief.material-icon-theme"
        "redhat.vscode-yaml"
        "streetsidesoftware.avro"
        "vscode-icons-team.vscode-icons"
        "yzhang.markdown-all-in-one"
        "zxh404.vscode-proto3"
        "TheNuProjectContributors.vscode-nushell-lang"
    ];
  };

  brews.rancher = {
    enable = false;
    hostResolver = false;
  };

  brews.cloudflare-warp = {
    enable = true;
  };


  # Add other shared app configurations here as needed
  # brews.someOtherApp = {
  #   enable = true;
  #   someOption = "value";
  # };
}
