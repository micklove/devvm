#TODO finish
exit 1

export LOCAL_SUBNET="192.168.0.0/24"
ufw status verbose
ufw default deny incoming
ufw default allow outgoing

# allow ssh / rdp / synergy locally
ufw allow from "${LOCAL_SUBNET}" to any port 22
ufw allow from "${LOCAL_SUBNET}" to any port 3389 proto tcp
ufw allow from "${LOCAL_SUBNET}" to any port 3390 proto tcp
ufw allow from "${LOCAL_SUBNET}" to any port 24800

ufw enable
ufw status verbose

# tail -f /var/log/ufw.log