module StackExchange

  class Questions::ByIds < Questions

    include Request::Ids

    def initialize(options={})
      required_keys!(options, [:ids], self)
      @request_path = "/questions/#{self.ids}"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/questions-by-ids"
    end
  end

end