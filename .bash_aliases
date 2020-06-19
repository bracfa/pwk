# VPN Log into the CSJ lab
alias vpn='cd /home/kali/CSJ/vpnChristine && sudo openvpn --config CSJ-PfSense-01-UDP4-5050-Christine-config.ovpn' 
# Print my pass for CSJ vpn
alias vpnp='cat /home/kali/CSJ/vpnPassChristine'
# Go to my PWK repo
alias pwk='cd /home/kali/gitWorkspace/pwk'
# Print out bashrc aliases
alias a='cat $HOME/.bash_aliases | grep "^alias " | cut -f1 -d" " --complement'
alias r='sudo shutdown -r now'
# Shutdown
alias s='sudo shutdown -h now'
