{
    description = "NixOS en una Chromebook!";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-25.11";
        home-manager = {
	    url = "github:nix-community/home-manager/release-25.11";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
	noctalia = {
	    url = "github:noctalia-dev/noctalia-shell";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
    };
    outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
	nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
	    specialArgs = { inherit inputs; };
	    modules = [
	        ./configuration.nix
		./noctalia.nix
		home-manager.nixosModules.home-manager
		{
		    home-manager = {
		        useGlobalPkgs = true;
			useUserPackages = true;
			users.solounrandom = import ./home.nix;
			backupFileExtension = "backup";
		    };
		}
            ];
        };
    };
}
