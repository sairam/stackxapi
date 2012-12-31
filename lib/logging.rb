module Logging
  def logger
    @logger ||= Logger.new('log/development.log')
  end
end