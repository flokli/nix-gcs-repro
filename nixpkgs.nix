let
  # 2019-09-12
  sha256 = "0b92yhkj3pq58svyrx7jp0njhaykwr29079izqn6qs638v8zvhl2";
  rev = "e19054ab3cd5b7cc9a01d0efc71c8fe310541065";
in
import (fetchTarball {
  inherit sha256;
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
})
