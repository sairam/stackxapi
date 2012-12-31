module StackExchange

  class Privileges < Base

    include Request::Site
    include Request::Paging

    def initialize(options={})
      @request_path = 'privileges'
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/privileges"
    end
  end

end
