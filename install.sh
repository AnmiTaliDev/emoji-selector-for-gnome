#!/bin/bash
cd "$(dirname "$0")" || exit 2

glib-compile-schemas ./emoji-selector@anmitali.kz/schemas

if (( $EUID == 0 )); then
	INSTALL_DIR="/usr/share/gnome-shell/extensions"
else
	INSTALL_DIR="$HOME/.local/share/gnome-shell/extensions"
fi

if [ ! -d $INSTALL_DIR ]; then
	mkdir $INSTALL_DIR
fi

echo "Installing extension files in $INSTALL_DIR/emoji-selector@anmitali.kz"
cp -r emoji-selector@anmitali.kz $INSTALL_DIR

echo "Done."
exit 0

