module StackExchange

  class Questions::Linked < Questions

    include Request::Ids

    def initialize(options={})
      required_keys!(options, [:ids], self)
      @request_path = "/questions/#{self.ids}/linked"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/linked-questions"
    end
  end

end