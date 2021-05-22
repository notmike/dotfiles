notmike's HHKB Keymap
===

An alternative controler for the HHKB designed by hasu.

Keyboard Maintainer: QMK Community
Hardware Supported: HHKB Alternate Controller
Hardware Availability: https://geekhack.org/index.php?topic=12047.0

# Pre-Reqs
[Documentation](https://docs.qmk.fm/#/newbs_flashing)
1. install qmk-firmware
2. copy over desired keymap to qmk-firmware repo directory *qmk_firmware/keyboards/hhkb/ansi/keymaps/notmike*
3. cd to root of qmk-firmware repo


# Compile/Flash
```
qmk compile -kb hhkb/ansi -km notmike
qmk flash -kb hhkb/ansi -km notmike
```

