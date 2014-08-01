require 'spec_helper'

describe Yabbie::Source do
  describe '#url?' do
    let(:source) { described_class.new('http://google.com') }

    it 'matches urls' do
      expect(source).to be_url
    end
  end

  describe '#file?' do
    let(:file) { File.open('spec/fixtures/source_file.html') }
    let(:source) { described_class.new(file) }

    it 'matches files' do
      expect(source).to be_file
    end
  end

  describe 'initialization' do
    context 'when argument is not url nor file' do
      it 'raises improper source error' do
        expect {
          described_class.new('what is this?')
        }.to raise_error(Yabbie::ImproperSourceError)
      end
    end
  end
end
