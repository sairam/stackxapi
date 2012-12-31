module StackExchange

  class Questions < Base
    include Request::Site
    include Request::Paging
    include Request::DateRange
    include Request::MinMax
    include Request::Orderable
    include Request::TagSortable
  end

  require_all File.dirname(__FILE__)+'/questions'

end