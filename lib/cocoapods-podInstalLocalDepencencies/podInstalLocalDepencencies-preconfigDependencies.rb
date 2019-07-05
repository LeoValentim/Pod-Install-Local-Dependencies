require 'cocoapods'

module CocoapodsPodinstallocaldepencencies

    class Podinstallocaldepencencies
        def save_pods_on_local_json(podsname)
            File.open("./Podfile_CommonPods.json","w") do |f|
                f.write(podsname.to_json)
            end
            Pod::UI.puts 'Saved Podfile_CommonPods.json'.green
        end

        def install_local_dependencies(local_dependencies)
            local_dependencies.each do |module_name, path|
                Pod::UI.puts "Installing #{module_name} dependencies...".green
                instalation = system("pod install --project-directory=#{path}")
                if !instalation
                    abort("Error on #{module_name} instalation".red)
                end
            end
        end

        def configPreUpdate(local_dependencies)
            local_dependencies.each do |module_name, path|
                Pod::UI.puts "Updating #{module_name} dependencies...".green
                upgrade = system("pod update --no-repo-update --project-directory=#{path}")
                if !upgrade
                    abort("Error on #{module_name} instalation".red)
                end
            end
        end
    end
    
end