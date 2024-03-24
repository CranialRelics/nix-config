{ pkgs, unstablePkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ghidra
    binwalk
    nmap
    wireshark
    pwntools
    
    
  ];
}