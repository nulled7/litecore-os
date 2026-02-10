{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Warsaw"; # set your time zone

  i18n.defaultLocale = "en_US.UTF-8"; # set your language
  i18n.extraLocaleSettings = {
    LC_ADDRESS      = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT  = "pl_PL.UTF-8";
    LC_MONETARY     = "pl_PL.UTF-8";
    LC_NAME         = "pl_PL.UTF-8";
    LC_NUMERIC      = "pl_PL.UTF-8";
    LC_PAPER        = "pl_PL.UTF-8";
    LC_TELEPHONE    = "pl_PL.UTF-8";
    LC_TIME         = "pl_PL.UTF-8";
  };

  # X11 + GNOME
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.mutter]
    experimental-features=['scale-monitor-framebuffer', 'xwayland-native-scaling']
  '';

  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  console.keyMap = "pl2";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
  };

  users.users.themis = {  # set your username
    isNormalUser = true;
    description = "themis";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # thunderbird
    ];
  };

  programs.firefox.enable = true;

  services.flatpak.enable = true; # if you don't use flatpaks, remove this

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.hide-top-bar
    gnomeExtensions.vitals
    gnomeExtensions.user-themes
    gnome-shell
    haruna
    ffmpeg
    ffmpegthumbnailer
    yt-dlp
    gallery-dl
    onlyoffice-desktopeditors
    fastfetch
  ];

  system.stateVersion = "25.11";
}
