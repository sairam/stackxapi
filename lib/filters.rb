module StackExchange

  class Filters < Base
  end

  class Filters::Filters < Filters
    include Request::Filters
    def initialize(options={})
      optional_keys!(options, [:filters], self)
      @request_path = ['filters', self.filters].compact.join("/")
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/read-filter"
    end
  end
end