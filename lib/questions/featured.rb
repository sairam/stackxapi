module StackExchange

  class Questions::Featured < Questions

    include Request::Tagged

    def initialize(options={})
      @request_path = "/questions/featured"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/featured-questions"
    end
  end

end