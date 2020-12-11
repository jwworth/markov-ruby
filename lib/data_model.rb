class DataModel
  PUNCTUATORS = /([,.!?—])/.freeze

  def self.prepare(text)
    tokens = tokenize(text)

    tokens.each_with_object(Hash.new([])).with_index do |(token, hash), index|
      next if index == tokens.length - 1

      hash[token] += [tokens[index + 1]]
    end
  end

  def self.tokenize(text)
    text.downcase.split(/\s+/).flat_map do |subtext|
      subtext.split(PUNCTUATORS)
    end
  end
end
