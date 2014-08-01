require 'shellwords'

module Yabbie
  class Slimer
    attr_accessor :source, :configuration
    attr_reader :options, :result, :error

    def initialize(url_or_file, options = {})
      @source  = Source.new(url_or_file)
      @options = Yabbie.configuration.default_options.merge(options)

      raise NoExecutableError.new unless File.exists?(Yabbie.configuration.slimerjs)
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
        Yabbie.configuration.slimerjs,
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

    def command_config_file
      "--config=#{options[:config_file]}"
    end

    def command_error_log
      "--error-log-file=#{options[:error_log_file]}"
    end

    def outfile
      if @outfile
        File.expand_path(@outfile)
      else
        "#{options[:tmpdir]}/#{Digest::MD5.hexdigest((Time.now.to_i + rand(9001)).to_s)}.#{format}"
      end
    end
  end
end
