module StackExchange
  module Request

    module DateRange
      # https://api.stackexchange.com/docs/dates
      attr_accessor :from_date, :to_date, :since
    end

    module Inname
      attr_accessor :inname
    end

    module Tags
      attr_accessor :ids
    end

    module MinMax
      attr_accessor :min, :max
    end

    module Orderable
      attr_accessor :order
    end

    module Paging
      # https://api.stackexchange.com/docs/paging
      attr_accessor :page_no, :page_size
    end

    module Period
      attr_accessor :period
    end

    module Site
      attr_accessor :site
    end

    module Tag
      attr_accessor :tag
    end

    module Tags
      attr_accessor :tags
    end

    module Tagged
      attr_accessor :tagged
    end

    module Ids
      attr_accessor :ids
    end

    module Filters
      attr_accessor :filters
    end

    module CommentSortable
      attr_accessor :sort
      # "sort votes, creation"
    end

    module QuestionSortable
      attr_accessor :sort
      # "sort activity, votes, creation, hot, week, month"
    end

    module TagSortable
      attr_accessor :sort
      # "sort popular, activity, name"
    end

    module TagSynonymsSortable
      attr_accessor :sort
      # "sort creation, applied, activity"
    end

    module UserSortable
      attr_accessor :sort
      # "sort activity, votes, creation"
    end

  end
end