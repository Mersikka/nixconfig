{
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ./modules
    ./services
    ./packages.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    extra-substituters = [
      "https://hyprland.cachix.org"
    ];

    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];

  };

  environment = {
    pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];

    etc = {
      "1password/custom_allowed_browsers" = {
        text = ''
          helium
        '';
        mode = "0755";
      };
    };
  };

  programs.ssh.startAgent = false;
  system.stateVersion = "26.05";
}
