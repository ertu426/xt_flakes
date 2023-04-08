{
  programs = {
    git = {
      enable = true;
      userName = "ertu426";
      userEmail = "erxat124@gmail.com";
      signing = {
        key = "D8078F20BB3D3E301FC4AED72108D103F6C674A9";
        signByDefault = true;
      };
      extraConfig = {
        init.defaultBranch = "main";
        url = {
          "ssh://git@github.com:ertu426" = {
            insteadOf = "https://github.com/ertu426/";
          };
        };
      };
    };
  };
}
