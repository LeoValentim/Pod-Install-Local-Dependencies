require 'cocoapods'
require 'cocoapods-podInstalLocalDepencencies/podInstalLocalDepencencies-preconfigDependencies'

include CocoapodsPodinstallocaldepencencies

module Pod
  class Command
    class Podinstallocaldepencencies < Command
      self.summary = 'Short description of cocoapods-podInstalLocalDepencencies.'

      self.description = <<-DESC
        Longer description of cocoapods-podInstalLocalDepencencies.
      DESC

      self.arguments = []

      # self.arguments = 'NAME'

      # def initialize(argv)
      #   @name = argv.shift_argument
      #   super
      # end

      # def validate!
      #   super
      #   help! 'A Pod name is required.' unless @name
      # end

      def run
        Pod::UI.puts "Teste"
        #CocoapodsPodinstallocaldepencencies::Podinstallocaldepencencies.new.configPreInstall()
      end
    end
  end
end
