#!/usr/bin/env bash

set -eou pipefail

vagrant up
#Ref : https://gist.github.com/jonasschultzmblox/f15fe3c10769d5f269635a54394c84d4
vagrant ssh -c "sudo yum -y update"
vagrant ssh -c "sudo yum -y install wget nano kernel-devel gcc"
vagrant ssh -c "sudo cd /opt && sudo wget http://download.virtualbox.org/virtualbox/5.1.12/VBoxGuestAdditions_5.1.12.iso -O /opt/VBGAdd.iso"
vagrant ssh -c "sudo mount /opt/VBGAdd.iso -o loop /mnt"
vagrant ssh -c "sudo sh /mnt/VBoxLinuxAdditions.run --nox11"
vagrant ssh -c "sudo umount /mnt"
vagrant ssh -c "sudo rm /opt/VBGAdd.iso"

#Check that we can halt and boot
vagrant halt
