require 'tmpdir'

module Yabbie
  class Configuration
    attr_accessor :default_options

    [:format, :tmpdir, :timeout, :config_file, :error_log_file, :width, :height, :prepend_command, :script].each do |m|
      define_method("#{m}=") do |val|
        @default_options[m] = val
      end
    end

    def initialize
      @default_options = {
        format:          'png',
        tmpdir:          Dir.tmpdir,
        timeout:         120000,
        config_file:     File.expand_path('../config.json', __FILE__),
        width:           600,
        height:          600,
        error_log_file:  Dir.tmpdir + "/log/yabbie_error.log",
        prepend_command: '',
        script:          File.expand_path('../default.js', __FILE__)
      }
    end

    def slimerjs
      @slimerjs ||= `which slimerjs`.chomp
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

