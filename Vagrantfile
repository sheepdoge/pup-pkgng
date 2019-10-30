# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "freebsd/FreeBSD-12.0-STABLE"

  config.vm.hostname = 'pup-pkgng-test'
  config.ssh.shell = "sh"

  config.vm.synced_folder ".", "/vagrant", type: "rsync"

  $setup_script = <<-SCRIPT
pkg install -y python3
SCRIPT

  config.vm.provision 'shell', inline: $setup_script

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'test.yml'
  end

  $verify_script = <<-SCRIPT
if ! which git >/dev/null; then
  exit 1
fi

if which tmux >/dev/null; then
  exit 1
fi
SCRIPT

  config.vm.provision 'shell', inline: $verify_script
end
