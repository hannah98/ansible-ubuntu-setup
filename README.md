# ansible-ubuntu-setup

## Add SSH key to github
### Generate if needed:
`ssh-keygen -t ed25519 -C "WSL windows laptop"`

## Clone this repository
`git clone git@github.com:hannah98/ansible-ubuntu-setup.git`

## Install ansible
```
sudo apt update && \
sudo add-apt-repository --yes --update ppa:ansible/ansible && \
sudo apt -y install software-properties-common make ansible
```

## Install dependencies
`make reqs`

## Run the playbook
`make run`
