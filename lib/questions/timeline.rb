module StackExchange

  class Questions::Timeline < Questions

    # no order, min,max, sort, order
    include Request::Ids

    def initialize(options={})
      required_keys!(options, [:ids], self)
      @request_path = "/questions/#{self.ids}/timeline"
      super(options)
    end

    def help
      "https://api.stackexchange.com/docs/questions-timeline"
    end
  end

end