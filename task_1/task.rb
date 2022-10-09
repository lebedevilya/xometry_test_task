require './data_fetcher'
require './report_parser'

class Task
  include HTTParty

  def call
    params = { report_type: 'plain', nonce: 'uniq-random-string' }.freeze

    # GET request to API
    response = DataFetcher.call('report', params)
    # Parse response
    result = ReportParser.call(response)

    puts result
  end
end

Task.new.call
