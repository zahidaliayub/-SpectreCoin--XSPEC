# -*- mode: ruby -*-
# vi: set ft=ruby :

require "yaml"

begin
    vagrant_config_filename = "Vagrantfile.config.yml"
    vagrant_config = YAML.load_file("#{vagrant_config_filename}")
rescue
    puts "ERROR: Unable to read #{vagrant_config_filename} (#{$!})"
    exit 1
end

Vagrant.configure("#{vagrant_config["version"]}") do |config|
    vagrant_config["vms"].each do |vm|
        vm_name = "#{vm["name"]}"
        vm_box = "#{vm["box"]}"
        vm_box_version = "#{vm["box_version"]}"
        vm_os_type = "#{vm["os_type"]}"

        vm_root_dir_prefix = ""
        vm_shell_script_cmd = "bash"
        vm_shell_script_extension = "sh"
        if vm_os_type.eql? "windows" then
            vm_root_dir_prefix = "C:"
            vm_shell_script_cmd = "powershell"
            vm_shell_script_extension = "ps1"
        end

        config.vm.define "#{vm_name}", autostart: false do |machine|
            machine.vm.box = "#{vm_box}"
            machine.vm.box_version = "#{vm_box_version}"
            machine.vm.box_check_update = false

            machine_build_dir = "/tmp/ProjectRoot/build"
            machine_source_dir = "/tmp/ProjectRoot/source"
            machine_provisioners = ["bootstrap", "build", "check", "deploy"]

            machine.vm.provision "upload_files", type: "file",
                source: ".",
                destination: "#{machine_source_dir}"

            machine_provisioners.each do |provisioner|
                provisioner_script = "cd \"$VAGRANT_SOURCE_DIR\" && bash \"$1\""
                if vm_os_type.eql? "windows" then
                    provisioner_script = "cd \"$env:VAGRANT_SOURCE_DIR\"; powershell \"$args\""
                end

                machine.vm.provision "#{provisioner}", type: "shell", privileged: true,
                    env: {
                        "VAGRANT_ENVIRONMENT" => true,
                        "VAGRANT_BUILD_DIR" => "#{vm_root_dir_prefix}#{machine_build_dir}",
                        "VAGRANT_SOURCE_DIR" => "#{vm_root_dir_prefix}#{machine_source_dir}"
                    },
                    args: "./scripts/ci/#{vm_name}/#{provisioner}.#{vm_shell_script_extension}",
                    inline: provisioner_script
            end

            machine.vm.synced_folder ".", "/vagrant", disabled: true
        end
    end

    config.vm.provider "virtualbox" do |virtualbox|
        virtualbox.gui = false
        virtualbox.cpus = 4
        virtualbox.memory = "4096"
    end
end
