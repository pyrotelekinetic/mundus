{ ... }: {

imports = [
  ./hardware.nix
  ../share/pyrosite.nix
];

networking = {
  hosts = {
    "192.168.1.2" = [ "luna" ];
  };
  interfaces.enp3s0.wakeOnLan.enable = true;
};

boot = {
  loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
      editor = false;
    };
    efi = {
      efiSysMountPoint = "/efi";
      canTouchEfiVariables = true;
    };
  };
  plymouth.enable = true;
};

}
