module StackExchange

  class Tags::TopAnswerers < Tags

    include Request::Period
    include Request::Tag

    def initialize(options={})
      required_keys!(options, [:period, :tag], self)
      @request_path = "/tags/#{self.tag}/top-answerers/#{self.period}"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/top-answerers-on-tags"
    end
  end

end
