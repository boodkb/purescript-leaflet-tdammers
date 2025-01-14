let
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/20.09.tar.gz";
  }) {};

  # To update to a newer version of easy-purescript-nix, run:
  # nix-prefetch-git https://github.com/justinwoo/easy-purescript-nix
  #
  # Then, copy the resulting rev and sha256 here.
  pursPkgs = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "fbbb27c1afd51d729939a6a2006e954dbd844846";
    sha256 = "1kw9cqycrq456dipd5mq7c1ij6jl3d9ajlnba152db3qrw5wmrg0";
  }) { inherit pkgs; };

in pkgs.stdenv.mkDerivation {
  name = "purescript-leaflet-tdammers";
  buildInputs = with pursPkgs; [
    pursPkgs.purs
    pursPkgs.pulp
    pkgs.nodePackages.bower
  ];
}
