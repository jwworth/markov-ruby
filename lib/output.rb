class Output
  def self.sentence(data)
    current_word = data.keys.sample
    next_word = get_next_word(current_word, data)
    result = [current_word, next_word]

    until next_word.match(/[.!?]/)
      current_word = next_word
      next_word = get_next_word(current_word, data)

      result << next_word
    end

    sentence = result.join(' ').capitalize
    sentence.gsub!(/\s([,.!?—])/, '\1')

    sentence
  end

  def self.get_next_word(word, data)
    data[word].sample
  end
end
