{ config, lib, pkgs, ... }:

{
  imports = [ (import ./clash-verge.nix) ];

  programs.clash-verge = {
    enable = true;
    tunMode = true;
    autoStart = true;
  };
}
