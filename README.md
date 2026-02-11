🗺️ Installation guide

1. Download NixOS if you haven't already done so. 
https://nixos.org/download/

2. Go to /etc/nixos/configuration.nix and paste litecore-os config

3. Set your username and time zone! ⚠️

4. If you want to remove an application, delete it in  environment.systemPackages = with pkgs; 

5. If you want to add another application, enter its name in environment.systemPackages = with pkgs;  and make sure it exists at https://search.nixos.org/packages

6. If the application is not available, download it via Flatpak.

❄️ Configuration contents:

- Steam, NVIDIA Drivers, firefox, GNOME extensions, experimental GNOME features etc.



In the future, I plan to build an .iso file and create an independent distribution based on this configuration.
