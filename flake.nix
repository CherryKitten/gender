{
  description = "gender";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      perSystem = { config, pkgs, ... }: {

        formatter = pkgs.nixpkgs-fmt;
        devShells. default = pkgs.mkShell {
          nativeBuildInputs = [ pkgs.cowsay pkgs.lolcat ];
          shellHook = ''
          echo "nya, im a lil kbity" | cowsay -f kitty | lolcat -a -F 1 -d 6
          exit
          '';
        };
      };

      flake = {};

    };
}
