{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    catppuccin.url = "github:catppuccin/nix/release-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    helium = {
      url = "github:AlvaroParker/helium-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

      openblasNoCheckOverlay = final: prev: {
        openblas = prev.openblas.overrideAttrs (old: {
          doCheck = false;
        });

        pkgsi686Linux = prev.pkgsi686Linux // {
          openblas = prev.pkgsi686Linux.openblas.overrideAttrs (old: {
            doCheck = false;
          });
        };
      };

      nixpkgsConfigModule = {
        nixpkgs.config.allowUnfree = true;

        nixpkgs.overlays = [
          openblasNoCheckOverlay
        ];
      };

    in
    {
      nixosConfigurations = {
        smallarchie = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs pkgs-unstable; 
          };

          modules = [
            ./nixos/configuration.nix
	    ./nixos/hw-confs/smallarchie-hardware-configuration.nix
            inputs.catppuccin.nixosModules.catppuccin
            { networking.hostName = "smallarchie"; }
          ];
        };

        sontiainen = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs pkgs-unstable;
          };

          modules = [
            ./nixos/configuration.nix
	    ./nixos/hw-confs/sontiainen-hardware-configuraion.nix
            inputs.catppuccin.nixosModules.catppuccin
            nixpkgsConfigModule

            { networking.hostName = "sontiainen"; }
          ];
        };

	sitti = nixpkgs.lib.nixosSystem {
	  inherit system;

	  specialArgs = {
	    inherit inputs pkgs-unstable;
	  };

	  modules = [
	    ./nixos/configuration.nix
	    ./nixos/hw-confs/sitti-hardware-configuration.nix
	    inputs.catppuccin.nixosModules.catppuccin
	    nixpkgsConfigModule

	    { networking.hostName = "sitti"; }
	  ];
	};
      };
    };
}
