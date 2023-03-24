# `~/bin`

## Bookmarks

`export-links.el` is based on [the `get-webjump-sites` function](https://github.com/larsen/emacs-configuration/blob/master/larsen-functions.el#L97) you can find in [my Emacs configuration](https://github.com/larsen/emacs-configuration).

## Touchpad

`touchpad_on.sh` and `touchpad_off` are called via udev rules.  On my system, I have a file `/etc/udev/rules.d/logitech.rules` like what follows:

```
ACTION=="add", SUBSYSTEM=="usb", ENV{ID_VENDOR_ID}=="046d", ENV{ID_MODEL_ID}=="c52b", RUN+="/home/larsen/bin/touchpad_off.sh"
ACTION=="remove", SUBSYSTEM=="usb", ENV{ID_VENDOR_ID}=="046d", ENV{ID_MODEL_ID}=="c52b", RUN+="/home/larsen/bin/touchpad_on.sh"
```

This way the touchpad is disabled when I attach the external trackpad, and viceversa.

## `clip2capture`

Inspired to [Howard Abrams's setup for capturing
content](http://www.howardism.org/Technical/Emacs/capturing-content.html),
a set of utilities that eliminates friction when taking notes using
Emacs + Org-mode.

- `clip.py` simply returns (as a HTML chunk of text) whatever happens
  to be in the clipboard (WIP, making it more robust)
- `clip2org` transforms it's input in a org-mode string suitable for
  being used with `org2capture`
- `clip2capture` captures whatever is passed on stdin to a org
  document, assuming there's a template associated to key `n`
