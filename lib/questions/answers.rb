module StackExchange

  class Questions::Answers < Questions

    include Request::Ids

    def initialize(options={})
      required_keys!(options, [:ids], self)
      @request_path = "/questions/#{self.ids}/answers"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/answers-on-questions"
    end
  end

end