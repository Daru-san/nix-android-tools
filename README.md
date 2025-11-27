# Nix android tools

This is a collection of android ROM development tools packaged for NixOS.

## Provided packages

| Name            | Repository                                          | Description                                           |
| --------------- | --------------------------------------------------- | ----------------------------------------------------- |
| `aospdtgen`     | <https://github.com/sebaubuntu-python/aospdtgen>    | Generate AOSP device trees from ROM dumps             |
| `dumpyara`      | <https://github.com/SebaUbuntu/dumpyara>            | Creates firmware dumps for Android devices            |
| `twrpdtgen`     | <https://github.com/twrpdtgen/twrpdtgen>            | Generate TWRP trees from Android recovery images      |
| `twrpdtgen_v2`  | <https://github.com/Biraru/twrpdtgen_v2>            | Generate TWRP trees from ROM dumps for Treble devices |
| `unpackbootimg` | <https://github.com/anestisb/android-unpackbootimg> | Unpack and repack Android boot images                 |

## Usage

### Nix shell/run

One way to use these utilities is to run them in a nix shell.

```bash
# Using a shell
nix shell github:Daru-san/nix-android-tools#aospdtgen
# or running directly
nix run github:Daru-san/nix-android-tools#dumpyara
```

### Nix flake

The flake can be imported in existing configurations to install the provided
packages.

```nix
# flake.nix
{
    inputs = {
        # Other inputs
        nix-android-tools.url = "github:Daru-san/nix-android-tools";
    };
}
```

```nix
# home.nix
{inputs, pkgs, ...}: {
    home.packages = with inputs.nix-android-tools.packages.${pkgs.system}; [
        aospdtgen
        dumpyara
        twrpdtgen
        twrpdtgen_v2
        unpackbootimg
    ];
}
```
