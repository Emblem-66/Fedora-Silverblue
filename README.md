# Fedora OSTree Images
[![Builds](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml/badge.svg)](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml)

Custom Fedora ostree images.
- Virt-manager added
- FFmpeg added
- Distrobox instead of Toolbox

## Silverblue 
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/silverblue:latest
```
Slimmed down Fedora Silverblue to be used with flatpaks.

## Steamblue
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/steamblue:latest
```
Fedora Silverblue with programs.

# References
- [Fedora Silverblue](https://fedoraproject.org/silverblue)
- [RPM-Fusion](https://rpmfusion.org/Howto/OSTree)
- [Virt-Manager](https://virt-manager.org)
- [Distrobox](https://github.com/89luca89/distrobox)
- [Inspiration: uBlue](https://github.com/ublue-os)
# Notes
- Cosign - don't see a reason, not gonna bother.
- Licence - don't see a reason, not gonna bother.

If you want to indicate that a table cell contains code or text that users can copy, you can use backticks (\`) to enclose the content within the cell. This is a common convention to denote code or text that can be copied. Here's an example:

```markdown
| Header 1    | Header 2    | Header 3    |
|-------------|-------------|-------------|
| `copyable`  | `copyable`  | `copyable`  |
| `copyable`  | `copyable`  | `copyable`  |
```

By enclosing the content in backticks, you're indicating to users that they can copy the text/code within those cells. This is a simple and effective way to achieve the "copy" flag within a table in Markdown.

