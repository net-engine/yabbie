module Yabbie
  class NoExecutableError < StandardError
    def initialize
      msg = "No slimerjs executable found at #{Yabbie.configuration.slimerjs}\n"
      msg << ">> Please install slimerjs"
      super(msg)
    end
  end

  class ImproperSourceError < StandardError
    def initialize(msg = nil)
      super("Improper Source: #{msg}")
    end
  end

  class RenderingError < StandardError
    def initialize(msg = nil)
      super("Rendering Error: #{msg}")
    end
  end
end

