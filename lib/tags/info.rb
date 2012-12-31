module StackExchange

  class Tags::Info < Tags

    include Request::DateRange
    include Request::MinMax
    include Request::Orderable
    include Request::TagSortable
    include Request::Tags

    def initialize(options={})
      required_keys!(options, [:tags], self)
      @request_path = "/tags/#{self.tags}/info"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/tags-by-name"
    end
  end

end