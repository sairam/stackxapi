module StackExchange

=begin
 backoff integer - may be absent
 error_id integer, refers to an error - may be absent
 error_message string - may be absent
 error_name string - may be absent
 has_more boolean
 items an array of the type found in type
 page integer - not present by default
 page_size integer - not present by default
 quota_max integer
 quota_remaining integer
 total integer - not present by default
 type string - not present by default

 All responses in the Stack Exchange API share a common format, so as to make parsing these responses simpler.

 The error_* fields, while technically elligible for filtering, will not actually be excluded in an error case. This is by design.

 page and page_size are whatever was passed into the method.

 If you're looking to just select total, exclude the items field in favor of excluding all the properties on the returned type.

 When building filters, this common wrapper object has no name. Refer to it with a leading ., so the items field would be refered to via .items.

 The backoff field is only set when the API detects the request took an unusually long time to run. When it is set an application must wait that number of seconds before calling that method again. Note that for the purposes of throttling and backoff, the /me routes are considered the same as their /users/{ids} equivalent.

=end
  class Response

    attr_accessor :error_id, :error_message, :error_name, :backoff
    attr_accessor :items, :total, :type, :page_size, :page, :quota_remaining, :quota_max, :has_more

    def initialize(options={})
      options.each do |k,v|
        self.send("#{k}=",v)
      end
    end

    def has_more?
      has_more
    end

    def help
      "https://api.stackexchange.com/docs/wrapper"
    end

  end
end