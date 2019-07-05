require 'json'
require 'fileutils'
require 'cocoapods-podInstalLocalDepencencies/command'
require_relative 'cocoapods-podInstalLocalDepencencies/podInstalLocalDepencencies-preconfigDependencies'

module CocoapodsPodinstallocaldepencencies
    Pod::Installer::InstallationOptions.option('PLD_local_dependencies', {})
    Pod::Installer::InstallationOptions.option('PLD_parent_path', '')

    Pod::HooksManager.register('cocoapods-podInstalLocalDepencencies', :pre_install) do |context|
        if context.local_dependencies == true
            options = context.podfile.installation_method.detect{|i| i.class == Hash}
            local_dependencies_option = options.detect{|i| i.first == :PLD_local_dependencies}
            if local_dependencies_option != nil && local_dependencies_option[1] != nil
                local_dependencies = local_dependencies_option[1]
                Podinstallocaldepencencies.new.install_local_dependencies(local_dependencies)
            end
        end
    end

    # Pod::HooksManager.register('cocoapods-podInstalLocalDepencencies', :post_install) do |context|

    #     podfile_path = context.sandbox_root.gsub('/Pods','')
    #     podfile = Pod::Podfile.from_ruby("#{podfile_path}/Podfile")
    #     options = podfile.installation_method.detect{|i| i.class == Hash}
    #     local_dependencies_option = options.detect{|i| i.first == :PLD_local_dependencies}

    #     options.each do |option|
    #         case option.first 
    #         when :PLD_local_dependencies
    #             if option[1] != nil
    #                 pld_installer = Podinstallocaldepencencies.new()
    #                 specs = context.umbrella_targets.first.specs
    #                 podsname = specs.map { |i| i.name } || []
    #                 pld_installer.save_pods_on_local_json(podsname)
    #                 local_dependencies = option[1]
    #                 pld_installer.install_local_dependencies(local_dependencies)
    #             end
    #         when :PLD_parent_path
    #             specs = context.umbrella_targets.first.specs
    #             podsname = specs.map { |i| i.name } || []
    #             common_pods = File.open("#{Dir.pwd}/Podfile_CommonPods.json","r").read
    #             common_pods = JSON.parse(common_pods)
                
    #             array_pods = []
    #             podsname.each do |i|
    #                 array_pods << i if common_pods.include?(i)
    #             end
    #             Pod::UI.puts(array_pods) 
    #         end
    #      end
    # end
    
    # Pod::HooksManager.register('cocoapods-podInstalLocalDepencencies', :pre_update) do |context|
    #     options = context.podfile.installation_method.detect{|i| i.class == Hash}
    #     local_dependencies_option = options.detect{|i| i.first == :PLD_local_dependencies}
    #     if local_dependencies_option != nil && local_dependencies_option[1] != nil
    #         local_dependencies = local_dependencies_option[1]
    #         Podinstallocaldepencencies.new.configPreUpdate(local_dependencies)
    #     end
    # end
end