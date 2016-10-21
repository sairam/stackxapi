module StackExchange

  class Questions::Questions < Questions

    include Request::QuestionSortable
    include Request::Tagged

    def initialize(options={})
      @request_path = "/questions"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/questions"
    end
  end

end