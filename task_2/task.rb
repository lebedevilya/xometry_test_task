class Masking
  def self.call(number)
    str = number.to_s
    str[0..-5] = '#' * (str.size - 4) if str.size > 4
    str
  end
end

[1234567812345678, 125678, 5678, 8].each do |num|
  puts Masking.call(num)
end
