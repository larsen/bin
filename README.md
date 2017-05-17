# `~/bin`

## Bookmarks

`export-links.el` is based on [the `get-webjump-sites` function](https://github.com/larsen/emacs-configuration/blob/master/larsen-functions.el#L97) you can find in [my Emacs configuration](https://github.com/larsen/emacs-configuration).

## Touchpad

`touchpad_on.sh` and `touchpad_off` are called via udev rules.  On my system, I have a file `/etc/udev/rules.d/logitech.rules` like what follows:

```
ACTION=="add", SUBSYSTEM=="usb", ENV{ID_VENDOR_ID}=="046d", ENV{ID_MODEL_ID}=="c52b", RUN+="/home/larsen/bin/touchpad_off.sh"
ACTION=="remove", SUBSYSTEM=="usb", ENV{ID_VENDOR_ID}=="046d", ENV{ID_MODEL_ID}=="c52b", RUN+="/home/larsen/bin/touchpad_on.sh"
```

This way the touchpad is disabled when I attach the extental trackpad, and viceversa.
