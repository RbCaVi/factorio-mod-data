{ pkgs }: {
    deps = [
      pkgs.cowsay
      pkgs.nodejs
      pkgs.jq
      pkgs.lua5_2
      pkgs.wget
      pkgs.unzip
      pkgs.cpio
    ];
}