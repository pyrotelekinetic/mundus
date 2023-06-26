{ config, lib, pkgs, ... }: with lib; {

imports = [
  ./sway.nix
  ./kitty.nix
  ./games.nix
];

options.graphical = {
  enable = mkEnableOption (mdDoc "graphical user environment");
  games = mkEnableOption (mdDoc "games :)");
};

config = mkMerge [
  ( mkIf config.graphical.enable {
    wayland.windowManager.sway.enable = true;
    programs.kitty.enable = true;
    programs.mako.enable = true;
    gtk.enable = true;
    qt.enable = true;

    # Use librsvg's gdk-pixbuf loader cache file as it enables gdk-pixbuf to load
    # SVG files (important for icons)
    home.sessionVariables.GDK_PIXBUF_MODULE_FILE = "$(echo ${pkgs.librsvg.out}/lib/gdk-pixbuf-2.0/*/loaders.cache)";
  } )

  {
    assertions = with config.graphical; [
      {
        assertion = games -> enable;
        message = "games need a graphical environment to run in";
      }
    ];
  }
];

}