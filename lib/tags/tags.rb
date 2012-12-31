module StackExchange

  # t = Tags.new({filter: 'ember.js'})
  # t.first
  # tag_name = t.result.items[0]['count']
  class Tags::Tags < Tags

    include Request::DateRange
    include Request::MinMax
    include Request::Orderable
    include Request::TagSortable
    include Request::Filter

    def initialize(options={})
      @request_path = 'tags'
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/tags"
    end
  end

end
