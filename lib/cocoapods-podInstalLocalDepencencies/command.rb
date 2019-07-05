require 'cocoapods'
require 'cocoapods-podInstalLocalDepencencies/installer_local_dependencies'

module Pod
    class Command
        def local_dependencies?(default: false)
            if @local_dependencies.nil?
              default
            else
              @local_dependencies
            end
        end

        def installer_for_config
            installerNew=Installer.new(config.sandbox, config.podfile, config.lockfile)
            installerNew.local_dependencies = local_dependencies?(default: false)
            return installerNew
        end

        class Install < Command
            def initialize(argv)
                super
                @local_dependencies = argv.flag?('local-dependencies', false)
            end

            def self.options
                [
                    ['--local-dependencies', 'Force running `pod install` for local dependencies'],
                ].concat(super)
            end
        end
    end
end