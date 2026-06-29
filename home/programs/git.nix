{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Mio Argillander";
        email = "mersikka@pm.me";
      };
      init.defaultBranch = "main";
      pull.rebase = "true";
    };
  };

}
