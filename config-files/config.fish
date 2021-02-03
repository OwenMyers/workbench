if status is-interactive
  alias nv='nvim'
  alias startopenvpn='sudo openvpn --config ~/PemAndOtherSecurityFiles/vpn_creds/new-ds-vpc/omyers.ovpn'
  alias gb='git branch'
  alias gs='git status'
  alias gc='git commit -m'
  alias icat="kitty +kitten icat"
  set -x LD_LIBRARY_PATH /usr/lib/cuda/lib64:$LD_LIBRARY_PATH
  set -x LD_LIBRARY_PATH /usr/lib/cuda/include:$LD_LIBRARY_PATH
  set -e LD_LIBRARY_PATH
  set -gx EDITOR nvim
end

if set -q VIRTUAL_ENV[1]
  source "$VIRTUAL_ENV/bin/activate.fish"
    echo "Activated python virtual env"
end

starship init fish | source
