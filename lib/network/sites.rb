module StackExchange
  class Sites < Base

    include Request::Paging

    def initialize
      @request_path = "sites"
    end

    def help
      "https://api.stackexchange.com/docs/sites"
    end
  end

end
