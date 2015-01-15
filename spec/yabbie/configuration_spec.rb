require 'spec_helper'

describe Yabbie::Configuration do
  subject { described_class.new }

  describe 'accessors' do
    context 'when values are not provided' do
      it 'falls back to defaults' do
        defaults = {
          format:          'png',
          tmpdir:          Dir.tmpdir,
          timeout:         120000,
          config_file:     File.expand_path('../../../lib/yabbie/config.json', __FILE__),
          width:           600,
          height:          600,
          error_log_file:  Dir.tmpdir + "/log/yabbie_error.log",
          prepend_command: '',
          script:          File.expand_path('../../../lib/yabbie/default.js', __FILE__),
          slimerjs:        `which slimerjs`.chomp
        }

        expect(subject.default_options).to eq(defaults)
      end
    end

    it 'defines accessor to format' do
      subject.format = 'jpg'
      expect(subject.default_options[:format]).to eq('jpg')
    end

    it 'defines accessor to tmpdir' do
      subject.tmpdir = '/test'
      expect(subject.default_options[:tmpdir]).to eq('/test')
    end

    it 'defines accessor to timeout' do
      subject.timeout = '9'
      expect(subject.default_options[:timeout]).to eq('9')
    end

    it 'defines accessor to config_file' do
      subject.config_file = 'config.json'
      expect(subject.default_options[:config_file]).to eq('config.json')
    end

    it 'defines accessor to error_log_file' do
      subject.error_log_file = 'error.log'
      expect(subject.default_options[:error_log_file]).to eq('error.log')
    end

    it 'defines accessor to width' do
      subject.width = '100px'
      expect(subject.default_options[:width]).to eq('100px')
    end

    it 'defines accessor to height' do
      subject.height = '100px'
      expect(subject.default_options[:height]).to eq('100px')
    end

    it 'defines accessor to prepend_command' do
      subject.prepend_command = 'RAILS_ENV=production'
      expect(subject.default_options[:prepend_command]).to eq('RAILS_ENV=production')
    end

    it 'defines accessor to script' do
      subject.script = 'config/cool_slimerjs_stuff.js'
      expect(subject.default_options[:script]).to eq('config/cool_slimerjs_stuff.js')
    end

    it 'defines accessor to slimerjs' do
      subject.slimerjs = '/sbin/slimerjs-094'
      expect(subject.default_options[:slimerjs]).to eq('/sbin/slimerjs-094')
    end
  end

  describe '.configuration' do
    it 'returns instance of configuration class' do
      expect(Yabbie.configuration).to be_an_instance_of(described_class)
    end
  end
end

