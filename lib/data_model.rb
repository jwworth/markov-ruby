class DataModel
  PUNCTUATORS = /([,.!?—])/.freeze

  def self.prepare(input)
    tokens = tokenize(input)

    tokens.each_with_object(Hash.new([])).with_index do |(token, hash), index|
      next if index == tokens.length - 1

      hash[token] += [tokens[index + 1]]
    end
  end

  def self.tokenize(text)
    text.downcase.split(/\s+/).flat_map do |substring|
      substring.split(PUNCTUATORS)
    end
  end
end
