#secure-ssh.sh
#author adaley0518
#creates a new ssh user using $l parameter
#adds a public key from the local repos or curled from the remote repo
#removes roots ability to ssh in
echo "Creating user $1"
sudo useradd -m -d /home/$1 -s /bin/bash $1
sudo mkdir /home/$1/.ssh
sudo wget -O /home/$1/.ssh/authorized_keys https://raw.githubusercontent.com/adaley0518/Tech_Journal/master/SYS265/linux/public-keys/id_rsa.pub
sudo chmod 700 /home/$1/.ssh
sudo chmod 600 /home/$1/.ssh/authorized_keys
sudo chown -R $1:$1 /home/$1/
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config

