{ pkgs, nixUnstable }:

let
  _google-cloud-cpp = (pkgs.enableDebugging (pkgs.callPackage ./google-cloud-cpp.nix { curl = (pkgs.enableDebugging pkgs.curl);}));

in (pkgs.enableDebugging (nixUnstable.overrideAttrs ( old: {
  src = pkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nix";
    rev = "f63d38558de9c3f2bc3b34c3c39aad8d6bc4e0d2";
    sha256 = "122l5r8i447qmsi5y5bpdy0phak5pn4j80bkbm9bbb29b9i5ff1f";
  };
  buildInputs = old.buildInputs ++ [ _google-cloud-cpp ];
})))
