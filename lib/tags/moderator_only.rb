module StackExchange

  class Tags::ModeratorOnly < Tags

    include Request::DateRange
    include Request::MinMax
    include Request::Orderable
    include Request::TagSortable
    include Request::Inname

    def initialize(options={})
      @request_path = "/tags/moderator-only"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/moderator-only-tags"
    end
  end

end
