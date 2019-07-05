require 'cocoapods'

module Pod
    class Installer
        class PreInstallHooksContext
            attr_accessor :local_dependencies
            alias_method :local_dependencies?, :local_dependencies
        end

        attr_accessor :local_dependencies
        alias_method :local_dependencies?, :local_dependencies

        def run_plugins_pre_install_hooks
            context = PreInstallHooksContext.generate(sandbox, podfile, lockfile)
            context.local_dependencies = local_dependencies
            HooksManager.run(:pre_install, context, plugins)
        end
    end
end