{ pkgs, unstablePkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    python312
    python312Packages.pip
    firefox

    vscode
    git
    git-cola
    meld

    obsidian
    veracrypt
    drawio
    libreoffice
    zeal
    zotero
    libsForQt5.k3b
    prusa-slicer
    gparted
  ];

  home-manager.users.sjw = { pkgs, ... }: {
    home.packages = [ pkgs.fish ];
    programs.fish.enable = true;

    programs.git = {
      enable = true;
      userEmail = "cranialrelics@proton.me";
      userName = "sjw";
      diff-so-fancy.enable = true;
      lfs.enable = true;
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        merge = {
          conflictStyle = "diff3";
            tool = "meld";
          };
          pull = {
            rebase = false;
          };
        };
    };

    programs.htop = {
      enable = true;
      settings.show_program_path = true;
    };

    programs.tmux = {
      enable = true;
      clock24 = true;
      historyLimit = 50000;
      escapeTime = 0;
      baseIndex = 1;
      plugins = with pkgs.tmuxPlugins; [
        gruvbox
        resurrect
      ];
      extraConfig = ''
        new-session -s main

        # Free the original Ctrl-b prefix keybinding
        unbind C-b

        # Setting the prefix from C-b to C-a
        set -g prefix `
        bind-key ` send-prefix

        # Create Panes: window splitting
        # Split vertically
        unbind %
        bind | split-window -h    # Prefix | to create vertical split

        # Split horizontally
        unbind '"'
        bind - split-window -v    # Prefix - to create horizontal split

        # Enable mouse support
        set -g mouse on
        bind-key -T prefix m set -g mouse\; display 'Mouse: #{?mouse,ON,OFF}'

        # Vi mode
        set-window-option -g mode-keys vi

        # upgrade $TERM
        set -g default-terminal "screen-256color"
      '';
    };

    programs.vscode = {
      enable = true;
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        ms-python.python
        alefragnani.Bookmarks
        ms-azuretools.vscode-docker
      ];
      keybindings = [
        {
          key = "ctrl+t";
          command = "workbench.action.terminal.toggleTerminal";
        }

      ];
      userSettings = {
        "code-runner.enableAppInsights" = false;
        "docker-explorer.enableTelemetry" = false;
        "extensions.ignoreRecommendations" = true;
        "material-icon-theme.showWelcomeMessage" = false;
        "pros.showWelcomeOnStartup" = false;
        "pros.useGoogleAnalytics" = false;
        "redhat.telemetry.enabled" = false;
        "telemetry.enableCrashReporter" = false;
        "telemetry.enableTelemetry" = false;
        "telemetry.telemetryLevel" = "off";
        "terminal.integrated.shellIntegration.enabled" = true;
        "terraform.telemetry.enabled" = false;
        "update.showReleaseNotes" = false;
        "vsicons.dontShowNewVersionMessage" = true;
        "workbench.welcomePage.walkthroughs.openOnInstall" = false;
        "workbench.sideBar.location": "right";
        "editor.mouseWheelZoom": true;
      };
    };

    dconf.settings = {
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Ctrl><Alt>t";
        command = "gnome-terminal";
        name = "open-terminal";
      };

      "org/gnome/desktop/interface" = {
        color-scheme = [
          "prefer-dark"
        ];
      };
    };

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "23.11";
  };
}
