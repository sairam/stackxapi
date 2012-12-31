module StackExchange

  class Tags::Required < Tags

    include Request::DateRange
    include Request::MinMax
    include Request::Orderable
    include Request::TagSortable
    include Request::Filter

    def initialize(options={})
      @request_path = 'tags/required'
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/required-tags"
    end
  end

end
