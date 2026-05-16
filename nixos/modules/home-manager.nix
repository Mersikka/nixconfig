{ inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mio = import ../../home-manager;
    extraSpecialArgs = { inherit inputs; };
  };
}
