require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Podinstallocaldepencencies do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ podInstalLocalDepencencies }).should.be.instance_of Command::Podinstallocaldepencencies
      end
    end
  end
end

