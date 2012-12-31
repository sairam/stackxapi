module StackExchange

  class Tags < Base
    include Request::Site
    include Request::Paging
  end

  require_all File.dirname(__FILE__)+'/tags'

end