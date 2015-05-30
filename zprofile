# Startup programs

[ ! -s ~/.config/mpd/pid ] && mpd

[ -s "/home/marcus/.k/kvm/kvm.sh" ] && . "/home/marcus/.k/kvm/kvm.sh" # Load kvm

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
