module StackExchange

  class Questions::Comments < Questions

    include Request::CommentSortable
    include Request::Ids

    def initialize(options={})
      required_keys!(options, [:ids], self)
      @request_path = "/questions/#{self.ids}/comments"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/comments-on-questions"
    end
  end

end