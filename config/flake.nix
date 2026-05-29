{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";

    lazyvim.url = "github:pfassina/lazyvim-nix";

    caelestia-shell.url = "github:caelestia-dots/shell";
  };

  outputs = { nixpkgs, home-manager, lazyvim, caelestia-shell, ... }: {
    homeConfigurations."xyconix" =
      home-manager.lib.homeManagerConfiguration {

        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [
          lazyvim.homeManagerModules.default
          ./home.nix
        ];

        extraSpecialArgs = {
          inherit caelestia-shell;
        };
      };
  };
}
