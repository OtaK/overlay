# otak-overlay

Personal overlay for the things I use, works on Funtoo, maybe it's not needed on Gentoo, because well updated packages

To install:

`sudo layman -o https://raw.githubusercontent.com/OtaK/overlay/master/repositories.xml -f -a otak-overlay`

## Overlay contents

### Ebuilds

- [x] Sublime Text 3 (3200)
- [x] Sublime Merge (1107)
- [x] Tilix (1.9.0)
- [x] Discord (0.0.9)
- [x] Spotify (1.1.0.237.g378f6f25)
- [x] Slack (3.3.8)
- [x] Mailspring (1.6.0)
- [x] Git-extras (4.7.0)
- [x] Fish (3.0.2)
- [x] Gnome Shell Extension AppIndicator (22, compatible up to gnome-shell 3.30)

### Package sets

- [x] @otak-dev:
    - Sublime Text 3
    - Sublime Merge
    - Git Extras
    - Git Flow
    - Tilix
    - Fish
- [x] @otak-work
    - Slack
    - Discord
    - Spotify (yes, this is work)
    - Mailspring
    - MPV
    - Albert
    - Google Chrome


## Greetings GitHub Users!

To contribute bug reports for this overlay, you can open up a GitHub issue or send
me a pull request.

If you are using ebuilds in this overlay as part of Funtoo Linux (because they are
merged into the main Funtoo Linux Portage tree, for example,) then
please also open an issue at `bugs.funtoo.org`_.
