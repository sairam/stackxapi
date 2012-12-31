module StackExchange
  class Base
    attr_reader :request_path, :result
    attr_accessor :key, :query, :filter

    include Logging
    # include Request::Site
    # include Request::Paging
    # include Request::DateRange
    # include Request::MinMax
    # include Request::Orderable
    # include Request::TagSortable
    # include Request::UserSortable
    # include Request::Period
    # include Request::Tags
    # include Request::Tag

    # other_defaults = {
    #   pagesize: 50,
    #   min: false,
    #   max: false,
    #   page: 1,
    #   from_date: Proc.new { (Date.current - 1.week) }
    #   to_date: Proc.new { Date.current.to_time }
    # }

    begin
      API_KEY = File.read('api_key.txt')
    rescue
    end

    def initialize(options = {})
      options.reverse_merge!(defaults)
      set_attributes(options)

      build_query
    end

    def set_attributes(options)

      if options.key?(:since_weeks)
        options[:from_date] = Date.current - options.delete(:since)
        options[:to_date] = Date.current
      end
      attribute_mapping.values.each do |v|
        self.send("#{v}=",options[v]) if self.respond_to?("#{v}=")
      end
      @from_date = date_time_to_i(@from_date)
      @to_date = date_time_to_i(@to_date)

    end
    def attribute_mapping
      {
      site: :site,
      sort: :sort,
      order: :order,
      fromdate: :from_date,
      todate: :to_date,
      min: :min,
      max: :max,
      pagesize: :page_size,
      page: :page_no,
      ids: :ids,
      period: :period,
      inname: :inname,
      filter: :filter,
      tagged: :tagged,
      tag: :tag,
      tags: :tags,
      ids: :ids,
      key: :key,
      }
    end

    def required_keys!(options, keys, klass)
      keys.each do |k|
        raise "One or more of #{keys.inspect} attributes are missing. Checking #{k}" unless options.key? k
      end
      optional_keys!(options, keys, klass)
    end

    def optional_keys!(options, keys, klass)
      keys.each do |k|
        klass.send("#{k}=",options.delete(k))
      end
    end

    def next
      unless @result
        first
      else
        unless @result.has_more?
          false
        else
          @page_no ||= 1
          @page_no+=1
          build_query
          request
        end
      end
    end

    def prev
      @page_no ||= 1
      @page_no-=1 if @page_no != 1
    end

    def first
      @page_no = 1
      request
    end

    def build_query
      self.query = {}
      attribute_mapping.each do |k,v|
        next unless respond_to?(v)
        val = self.send(v)
        query[k] = val unless val.nil?
      end
    end

    def defaults
      {
        site: 'stackoverflow',
        order: 'desc', # desc, asc
        page_size: 30, # default is 30 . max is 100
        key: API_KEY
      }
    end
    def request
      options = {
        api_version: '2.1',
        host: 'api.stackexchange.com',
        protocol: 'https'
      }
      # https://github.com/geemus/excon
      url = "#{options[:protocol]}://#{options[:host]}"
      logger.info url
      logger.info @request_path
      response = Excon.get(url, path: "/#{options[:api_version]}/#{@request_path}", query: self.query )
      data = if response.headers['Content-Encoding'] == 'gzip'
        Zlib::GzipReader.new(StringIO.new(response.body)).read
      else
        response.body
      end
      @result = Response.new(JSON.parse(data))
    end

    def date_time_to_i(date)
      if date.class == Date
        date = date.to_time.to_i
      elsif date.class == Time
        date = date.to_i
      end
    end

  end
end