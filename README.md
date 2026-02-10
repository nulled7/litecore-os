🗺️ Installation guide

1. Download NixOS if you haven't already done so. 
https://nixos.org/download/

2. Go to /etc/nixos/configuration.nix and paste litecore-os config

3. Set your username and time zone! ⚠️

4. If you want to remove an application, delete it in  environment.systemPackages = with pkgs; [

5. If you want to add another application, enter its name and make sure it exists at https://search.nixos.org/packages

6. If the application is not available, download it via Flatpak.
