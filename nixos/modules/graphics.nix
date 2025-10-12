{config, pkgs, ...}:

{
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    xkb = {
      layout = "pl";
      variant = "";
      };
  };
    
  hardware.graphics = {
    enable = true;
    enable32Bit = true;  
  };

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    powerManagement = {
      enable = true;
    };
    open = false;
  };
}
