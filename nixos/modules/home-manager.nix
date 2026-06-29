{ pkgs-unstable, inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mio = import ../../home/default.nix;
    extraSpecialArgs = { inherit inputs pkgs-unstable; };
  };
}
