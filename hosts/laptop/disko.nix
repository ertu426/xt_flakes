# pre-install, need run  this command ` nix --extra-experimental-features nix-command --extra-experimental-features flakes run github:nix-community/disko -- --mode zap_create_mount /tmp/disko-config.nix `

# more information get -> https://github.com/nix-community/disko
{ disko ? [ "/dev/nvme0n1p6" "/dev/nvme0n1p7" ] }:
{
  disko.devices = {
    disk = {
      nvme0n1p6 = {
        device = builtins.elemAt disks 0;
        type = "disk";
        content = {
          type = "table";
          format = "gpt";
          partitions = [
            {
              name = "ESP";
              start = "1MiB";
              end = "100%";
              bootable = true;
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot/efi";
              };
            }
          ];
        };
      };
      nvme0n1p7 = {
        device = builtins.elemAt disks 1;
        type = "disk";
        content = {
          type = "table";
          format = "gpt";
          partitions = [
            {
              name = "nix";
              start = "1MiB";
              end = "100%";
              part-type = "primary";
              bootable = true;
              content = {
                type = "filesystem";
                format = "btrfs";
                subvolumes = {
                  "/@" = {
                    mountpoint = "/nix";
                  };
                };
              };
            }
          ];
        };
      };
    };
    nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = [
          "defaults"
          "size=12G"
          "mode=755"
        ];
      };
    };
  };
}
