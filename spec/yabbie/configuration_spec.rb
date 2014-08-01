require 'spec_helper'

describe Yabbie::Configuration do
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
end
