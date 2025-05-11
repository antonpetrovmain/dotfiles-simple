{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "anton-tools";
      paths = [
        neovim
        bash-completion
        tmux
        jdk23
        python314
        maven
        xsel
        nodejs_23
      ];
    };
  };
}

