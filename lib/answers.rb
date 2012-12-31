module StackExchange

  class Answers < Base

    include Request::Site
    include Request::Paging
    include Request::DateRange
    include Request::MinMax
    include Request::Orderable
  end

  class Answers::Answers < Answers
    include Request::UserSortable
    def initialize(options={})
      @request_path = 'answers'
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/answers"
    end
  end

  class Answers::ByIds < Answers
    include Request::UserSortable
    include Request::Ids
    def initialize(options={})
      required_keys!(options, [:ids], self)

      @request_path = "answers/#{self.ids}"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/answers-by-ids"
    end
  end

  class Answers::CommentsByIds < Answers
    include Request::CommentSortable
    include Request::Ids
    def initialize(options={})
      required_keys!(options, [:ids], self)
      @request_path = "answers/#{self.ids}/comments"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/comments-on-answers"
    end
  end

end
