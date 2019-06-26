require 'cocoapods-podInstalLocalDepencencies/command'
require_relative 'cocoapods-podInstalLocalDepencencies/podInstalLocalDepencencies-preconfigDependencies'

module CocoapodsPodinstallocaldepencencies
    Pod::Installer::InstallationOptions.option('PLD_local_dependencies', {})

    Pod::HooksManager.register('cocoapods-podInstalLocalDepencencies', :pre_install) do |context|
        options = context.podfile.installation_method.detect{|i| i.class == Hash}
        local_dependencies_option = options.detect{|i| i.first == :PLD_local_dependencies}
        if local_dependencies_option != nil && local_dependencies_option[1] != nil
            local_dependencies = local_dependencies_option[1]
            Podinstallocaldepencencies.new.configPreInstall(local_dependencies)
        end
    end
    
    Pod::HooksManager.register('cocoapods-podInstalLocalDepencencies', :pre_update) do |context|
        options = context.podfile.installation_method.detect{|i| i.class == Hash}
        local_dependencies_option = options.detect{|i| i.first == :PLD_local_dependencies}
        if local_dependencies_option != nil && local_dependencies_option[1] != nil
            local_dependencies = local_dependencies_option[1]
            Podinstallocaldepencencies.new.configPreUpdate(local_dependencies)
        end
    end
end