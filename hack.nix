{ pkgs, unstablePkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ghidra
    binwalk
    nmap
    wireshark
    pwntools
    burpsuite



    unixtools.netstat
    minicom
    arduino
    gnuradio
    saleae-logic-2

  ];
}