class DataModel
  def self.prepare(input)
    tokens = input.split(/\s+/)

    result = Hash.new([])
    tokens.map.with_index do |token, index|
      next if index == tokens.length - 1

      result[token] += [tokens[index + 1]]
    end

    result
  end

  def self.tokenize(input)
    input.downcase.partition(/[\.\!\?]/).flat_map do |substring|
      substring.split(/\s+/)
    end
  end
end
