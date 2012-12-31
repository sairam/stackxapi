module StackExchange

  class Questions::NoAnswers < Questions

    include Request::Tagged

    def initialize(options={})
      @request_path = "/questions/no-answers"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/no-answer-questions"
    end
  end

end