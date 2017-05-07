# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box_check_update = false

    config.vm.synced_folder ".", "/vagrant"

    _script_prefix = "./scripts/ci"
    _script_names = ["bootstrap", "build", "check", "dist"]
    # _target_platforms = ["macos", "ubuntu32", ...]

    config.vm.define "macos", autostart: false do |macos|
        macos.vm.box = "busybox-macos-v10.12.4"
        macos.vm.hostname = "macos"

        _script_names.each { |script|
            macos.vm.provision "#{script}", type: "shell", run: "never", privileged: false,
                path: "#{_script_prefix}/macos/#{script}.sh"
        }
    end

    config.vm.define "ubuntu32", autostart: false do |ubuntu32|
        ubuntu32.vm.box = "busybox-ubuntu-v16.04.0-x86_64"
        ubuntu32.vm.hostname = "ubuntu32"

        _script_names.each { |script|
            ubuntu32.vm.provision "#{script}", type: "shell", run: "never", privileged: false,
                path: "#{_script_prefix}/ubuntu32/#{script}.sh"
        }
    end

    config.vm.define "ubuntu64", autostart: false do |ubuntu64|
        ubuntu64.vm.box = "busybox-ubuntu-v16.04.0-x86_64"
        ubuntu64.vm.hostname = "ubuntu64"

        _script_names.each { |script|
            ubuntu64.vm.provision "#{script}", type: "shell", run: "never", privileged: false,
                path: "#{_script_prefix}/ubuntu64/#{script}.sh"
        }
    end

    config.vm.define "windows32", autostart: false do |windows32|
        windows32.vm.box = "busybox-windows-v10.0.10240-x86_64"
        windows32.vm.hostname = "windows32"

        _script_names.each { |script|
            windows32.vm.provision "#{script}", type: "shell", run: "never", privileged: false,
                path: "#{_script_prefix}/windows32/#{script}.ps1"
        }
    end

    config.vm.define "windows64", autostart: false do |windows64|
        windows64.vm.box = "busybox-windows-v10.0.10240-x86_64"
        windows64.vm.hostname = "windows64"

       _script_names.each { |script|
           windows64.vm.provision "#{script}", type: "shell", run: "never", privileged: false,
               path: "#{_script_prefix}/windows64/#{script}.ps1"
       }
    end

    config.vm.provider "virtualbox" do |virtualbox|
        virtualbox.gui = false
        virtualbox.cpus = 4
        virtualbox.memory = "4096"
    end
end
