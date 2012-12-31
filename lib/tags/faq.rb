module StackExchange

  class Tags::Faq < Tags

    include Request::Tags

    # {tags} can contain up to 5 individual tags per request.

    def initialize(options={})
      required_keys!(options, [:tags], self)
      @request_path = "tags/#{self.tags}/faq"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/faqs-by-tags"
    end
  end

end
