{ pkgs-unstable, inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mio = import ../../home-manager/default.nix;
    extraSpecialArgs = { inherit inputs pkgs-unstable; };
  };
}
