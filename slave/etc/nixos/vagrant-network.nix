{ config, pkgs, ... }:
{
  networking.interfaces = [
    { 
      name         = "enp0s8";
      ipAddress    = "192.168.80.4";
      prefixLength = 24;
    }
    { 
      name         = "enp0s9";
      ipAddress    = "192.168.90.4";
      prefixLength = 24;
    }
  ];
}

