{pkgs, ...}:
{
  fonts = {
    packages = [
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.mononoki
      pkgs.nerd-fonts.agave
    ];
  }; 
}
