module StackExchange

  class Tags::Related < Tags
    include Request::Tags

    def initialize(options={})
      required_keys!(options, [:tags], self)
      @request_path = "/tags/#{self.tags}/related"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/related-tags"
    end
  end

end