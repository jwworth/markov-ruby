class Output
  def self.sentence(markov_model)
    current_word = markov_model.keys.sample
    next_word = get_next_word(current_word, markov_model)
    result = [current_word, next_word]

    until next_word.match(/[.!?]/)
      current_word = next_word
      next_word = get_next_word(current_word, markov_model)

      result << next_word
    end

    sentence = result.join(' ').capitalize

    # This can be better
    sentence.slice!(-2)

    sentence
  end

  def self.get_next_word(word, model)
    model[word].sample
  end
end
