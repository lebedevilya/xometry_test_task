class ReportParser
  def self.call(data)
    rows = data.split(/\n+/).map do |row|
      row.match(/URL: (\S*), /)[1]
    end

    rows.tally.map do |k, v|
      "#{k} - #{v}"
    end
  end
end
