module StackExchange

  class Tags::Synonyms < Tags

    include Request::DateRange
    include Request::MinMax
    include Request::Orderable
    include Request::TagSynonymsSortable
    include Request::Tags

    def initialize(options={})
      optional_keys!(options, [:tags], self)
      @request_path = ['tags',self.tags,'synonyms'].compact.join("/")
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/synonyms-by-tags"
    end
  end

end