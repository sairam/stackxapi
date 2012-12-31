module StackExchange

  class Questions::Unanswered < Questions

    include Request::Tagged

    def initialize(options={})
      @request_path = "/questions/unanswered"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/unanswered-questions"
    end
  end

end