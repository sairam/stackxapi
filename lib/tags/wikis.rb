module StackExchange

  class Tags::Wikis < Tags

    include Request::Period
    include Request::Tags

    def initialize(options={})
      required_keys!(options, [:tags], self)
      @request_path = "/tags/#{self.tags}/wikis"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/wikis-by-tags"
    end
  end

end
