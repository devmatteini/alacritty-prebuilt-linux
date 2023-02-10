# alacritty-prebuilt-linux

[alacritty](https://github.com/alacritty/alacritty) does not provide prebuilt binary for linux.

The scripts does:

- Build alacritty with docker
- Copy binary to `$HOME/.local/bin` (and bash completion)
- Setup desktop entry

## Usage

```bash
./build.sh
```

**NOTE:** Tested on Ubuntu 22.04/22.10
