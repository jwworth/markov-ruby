class Output
  def self.sentence(data)
    current_word = data.keys.sample
    next_word = get_next_word(current_word, data)
    holder = [current_word, next_word]

    until next_word.match(/[.!?]/)
      current_word = next_word
      next_word = get_next_word(current_word, data)

      holder << next_word
    end

    sentence = holder.join(' ').capitalize.gsub(/\s([,.!?—])/, '\1')

    sentence
  end

  def self.get_next_word(word, data)
    data[word].sample
  end
end
