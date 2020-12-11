class DataModel
  def self.prepare(input)
    tokens = tokenize(input)

    holder = Hash.new([])
    tokens.each_with_object(holder).with_index do |(token, hash), index|
      next if index == tokens.length - 1

      hash[token] += [tokens[index + 1]]
    end
  end

  def self.tokenize(text)
    text.downcase.split(/\s+/).flat_map do |substring|
      substring.split(/([,.!?—])/)
    end
  end
end
