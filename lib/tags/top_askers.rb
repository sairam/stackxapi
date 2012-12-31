module StackExchange

  class Tags::TopAskers < Tags

    include Request::Period
    include Request::Tag

    def initialize(options={})
      required_keys!(options, [:period, :tag], self)
      @request_path = "/tags/#{self.tag}/top-askers/#{self.period}"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/top-askers-on-tags"
    end
  end

end
# period - all_time,month