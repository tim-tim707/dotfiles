{ config, pkgs, ... }:

{
# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

# Home Manager needs a bit of information about you and the
# paths it should manage.
    home.username = "timothee.denizou";
    home.homeDirectory = "/home/timothee.denizou";

# This value determines the Home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new Home Manager release introduces backwards
# incompatible changes.
#
# You can update Home Manager without changing this value. See
# the Home Manager release notes for a list of state version
# changes in each release.
    home.stateVersion = "21.05";
}

programs.zsh = {
    enable = true;
    shellAliases = {
        ll = "ls -l";
        update = "nixos-rebuild switch";
    };
    history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
        enable = true;
        plugins = [
            "git"
                "zsh-autosuggestions"
                "colored-man-pages"
        ];
        theme = "robbyrussel";
    };
};
