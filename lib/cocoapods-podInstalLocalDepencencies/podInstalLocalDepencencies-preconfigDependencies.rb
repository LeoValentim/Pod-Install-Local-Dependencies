require 'cocoapods'

module CocoapodsPodinstallocaldepencencies
    class Podinstallocaldepencencies
        def configPreInstall(local_dependencies)
            local_dependencies.each do |podname, path|
                Pod::UI.puts "Installing #{podname} dependencies...".green
                instalation = system("pod install --project-directory=#{path}")
                if !instalation
                    abort("Error on #{podname} instalation".red)
                end
            end
        end

        def configPreUpdate(local_dependencies)
            local_dependencies.each do |podname, path|
                Pod::UI.puts "Updating #{podname} dependencies...".green
                upgrade = system("pod update --no-repo-update --project-directory=#{path}")
                if !upgrade
                    abort("Error on #{podname} instalation".red)
                end
            end
        end
    end
end