{ pkgs, unstablePkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    python312
    firefox
    
    vscode
    git
    git-cola
    meld

    obsidian
    veracrypt
    drawio
    libreoffice
    zeal
    zotero
    libsForQt5.k3b
    prusa-slicer
    gparted
  ];
}
