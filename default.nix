{ }:

with import <nixpkgs> {};
with buildRustCrateHelpers;

((import ./Cargo.nix).rooster {}).override {
  crateOverrides = defaultCrateOverrides // {
    rooster = attrs: {
      buildInputs = [
        libsodium xorg.libxcb
      ];
    };
  };
}
