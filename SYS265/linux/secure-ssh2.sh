#secure-ssh.sh
#author adaley0518
#creates a new ssh user using $l parameter
#adds a public key from the local repos or curled from the remote repo
#removes roots ability to ssh in
USER=$1

sudo useradd -m -d /home/$USER -s /bin/bash $USER
sudo mkdir /home/$USER/.ssh
sudo cp /linux/public-keys/id_rsa.pub /home/$USER/.ssh/authorized_keys
sudo chmod 700 /home/$USER/.ssh
sudo chmod 600 /home/$USER/.ssh/authorized_keys
sudo chown -R $USER:$USER /home/$USER/.ssh

