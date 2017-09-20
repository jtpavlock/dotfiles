# ssh tunnel
alias ssh-tunnel='ssh -D 8123 -f -C -q -N'

# usna mount
alias mount-usna='sshfs usna:/home/mids/m184998/school /home/jacob/school'
alias umount-usna='fusermount -u /home/jacob/school'

# pfp mount
alias mount-pfp='sshfs usna:/var/www/html/PoweredFlight/pfp /home/jacob/pfp-remote'
alias umount-pfp='fusermount -u /home/jacob/pfp-remote'

# nas copy downloads to watch
alias scp-nas='scp /home/jacob/Downloads/* jacob@nas:/mnt/tank/watch'
