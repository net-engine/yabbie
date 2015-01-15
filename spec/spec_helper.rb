require 'yabbie'
require 'pry'

RSpec.configure do |config|
  config.order = 'random'

  config.before do
    allow_any_instance_of(Yabbie::Slimer).to receive(:`).and_return('/usr/bin/slimerjs')
  end

end

