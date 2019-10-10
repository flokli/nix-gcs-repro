let
  nixpkgs = (import ./nixpkgs.nix {
    overlays = [ (import ./overlay.nix) ];
  });
in {
  shell = nixpkgs.mkShell {
    name = "nix-with-gcs";
    buildInputs = [ nixpkgs.nix ];
  };
}
