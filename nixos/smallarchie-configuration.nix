{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./smallarchie-hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ./modules
    ./services
    ./packages.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  programs.ssh.startAgent = false;

  system.stateVersion = "25.11";
}
