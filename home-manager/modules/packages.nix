{pkgs, inputs, ...}:
{
  home.packages = with pkgs; [
    inputs.nixvim.packages.${system}.default # enable nixvim flake
    # Global compilers
    # gcc
    # Terminal apps
    ripgrep # better grep
    fd # better find
    brightnessctl
    zip
    unzip
    nethogs
    # Monitoring
    acpi
    usbutils
    # Gui apps
    firefox
    pavucontrol
    blueman
    obsidian
    # Wayland specific
    wl-clipboard
    hyprpicker
    hyprpaper
    hyprshot
    hyprlock
    dunst
    waybar
    rofi
    wezterm
    kitty
    tmux
    # neovim
  ];
}
