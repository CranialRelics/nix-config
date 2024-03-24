{ pkgs, unstablePkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  
    fish
    tmux
    neovim
    mosh
    tree
    htop
    unzip
    wget
    git
    
    
  
  ];
}
