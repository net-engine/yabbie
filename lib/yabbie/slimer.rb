require 'shellwords'
require 'digest/md5'

module Yabbie
  class Slimer
    attr_accessor :source, :configuration
    attr_reader :options, :result, :error

    def initialize(url_or_file, opts = {})
      @source  = Source.new(url_or_file)
      @options = Yabbie.configuration.default_options.merge(opts)

      raise NoExecutableError.new(options[:slimerjs]) unless command?(options[:slimerjs])
    end

    def run
      @error  = nil
      @result = `#{cmd}`

      unless $?.exitstatus == 0
        @error  = @result
        @result = nil
      end

      @result
    end

    def cmd
      [
        prepend_command,
        slimerjs,
        command_config_file,
        command_error_log,
        script,
        @source.to_s.shellescape,
        outfile,
        width,
        height,
        format,
        timeout
      ].join(" ").strip
    end

    def render(path = nil)
      @outfile = File.expand_path(path) if path
      self.run

      raise Yabbie::RenderingError.new(@error) if @error

      @outfile
    end

    def to_file(path = nil)
      self.render(path)
      File.new(@outfile)
    end

    def to_string(path = nil)
      File.open(self.render(path)).read
    end

    private

    def format
      options[:format]
    end

    def timeout
      options[:timeout]
    end

    def width
      options[:width]
    end

    def height
      options[:height]
    end

    def script
      options[:script]
    end

    def prepend_command
      options[:prepend_command]
    end

    def slimerjs
      options[:slimerjs]
    end

    def command_config_file
      options[:config_file].empty? ? nil : "--config=#{options[:config_file]}"
    end

    def command_error_log
      options[:error_log_file].empty? ? nil : "--error-log-file=#{options[:error_log_file]}"
    end

    def outfile
      if @outfile
        File.expand_path(@outfile)
      else
        "#{options[:tmpdir]}/#{Digest::MD5.hexdigest((Time.now.to_i + rand(9001)).to_s)}.#{format}"
      end
    end

    def command?(name)
      !`which #{name}`.empty?
    end
  end
end
