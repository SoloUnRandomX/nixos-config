{ config, pkgs, ... }:

{
    home.username = "solounrandom";
    home.homeDirectory = "/home/solounrandom";
    programs.git.enable = true;
    home.stateVersion = "25.11";
    programs.bash = {
        enable = true;
        shellAliases = {
            btw = "echo I use Nix btw ^^";
        };
    };
    programs.bash.bashrcExtra = "fastfetch";

    home.packages = with pkgs; [
        ripgrep
	nil
	nixpkgs-fmt
	nodejs
	gcc
	fastfetch
	fuzzel
	cmatrix
	gimp2
    ];
}
