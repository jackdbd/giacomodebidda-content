{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  enterShell = ''
    versions
  '';

  env = {
    GREET = "devenv";
  };

  languages.nix.enable = true;

  packages = with pkgs; [
    git
    git-lfs
    git-filter-repo
  ];

  pre-commit.hooks.shellcheck.enable = true;

  scripts = {
    versions.exec = ''
      echo "=== Versions ==="
      git --version
      git-lfs --version
      echo "git filter-repo version $(git filter-repo --version)"
      echo "=== === ==="
    '';
  };
}
