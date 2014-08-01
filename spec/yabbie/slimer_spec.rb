require 'spec_helper'

describe Yabbie::Slimer do
  let(:options) {
    {
      prepend_command: 'SLIMERJSLAUCHER=/app/firefox',
      config_file:     'config.js',
      error_log_file:  'error.log',
      script:          'snapshot.js',
      width:           10,
      height:          10,
      format:          'pdf',
      tmpdir:          '/tmp',
      timeout:         10
    }
  }

  subject { described_class.new('http://google.com', options) }

  before(:each) do
    # Assume slimerjs is installed
    allow(File).to receive(:exists?).and_return(true)
    allow(Yabbie.configuration).to receive(:slimerjs).and_return('/usr/bin/slimerjs')
    allow(Digest::MD5).to receive(:hexdigest).and_return('md5')
  end

  describe 'initialization' do
    context 'when slimerjs is not present in the system' do
      it 'raises no executable error' do
        allow(File).to receive(:exists?).and_return(false)

        expect {
          described_class.new('http://google.com')
        }.to raise_error(Yabbie::NoExecutableError)
      end
    end
  end

  describe '#cmd' do
    it 'joins slimerjs options as a command' do
      command = 'SLIMERJSLAUCHER=/app/firefox /usr/bin/slimerjs --config=config.js --error-log-file=error.log snapshot.js http://google.com /tmp/md5.pdf 10 10 pdf 10'

      expect(subject.cmd).to eq(command)
    end
  end
end
