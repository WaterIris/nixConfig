{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    inputs.nixvim.packages.${system}.default # enable nixvim flake
    # Terminal apps
    ripgrep # better grep
    fd # better find
    brightnessctl
    zip
    unzip
    # Monitoring
    acpi
    usbutils
    libnotify
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
    nemo
    nixfmt-rfc-style
  ];
}
