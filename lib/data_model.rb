# frozen_string_literal: true

class DataModel
  PUNCTUATORS = /([,.!?—])/.freeze

  def self.prepare(text)
    tokens = tokenize(text)

    tokens.each_with_object(Hash.new([])).with_index do |(token, holder), index|
      next if index == tokens.length - 1

      holder[token] += [tokens[index + 1]]
    end
  end

  def self.tokenize(text)
    text.downcase.split(/\s+/).flat_map do |subtext|
      subtext.split(PUNCTUATORS)
    end
  end
end
