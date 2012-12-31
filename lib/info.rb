module StackExchange

  class Info < Base

    include Request::Site
    include Request::Paging

    def initialize(options={})
      @request_path = 'info'
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/info"
    end
  end

end
