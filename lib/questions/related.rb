module StackExchange

  class Questions::Related < Questions

    include Request::Ids

    def initialize(options={})
      required_keys!(options, [:ids], self)
      @request_path = "/questions/#{self.ids}/related"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/related-questions"
    end
  end

end