# Startup programs

[ ! -s ~/.config/mpd/pid ] && mpd

[ -s "/home/marcus/.k/kvm/kvm.sh" ] && . "/home/marcus/.k/kvm/kvm.sh" # Load kvm

#eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
envfile="$HOME/.gnupg/gpg-agent.env"

if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval "$(cat "$envfile")"
else
    eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
fi
export GPG_AGENT_INFO  # the env file does not contain the export statement
export SSH_AUTH_SOCK   # enable gpg-agent for ssh

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
