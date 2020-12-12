# frozen_string_literal: true

class Output
  TERMINATORS = /[.!?]/.freeze
  SPACED_PUNCTUATORS = /\s([,.!?—])/.freeze

  def self.sentence(data)
    current_word = data.keys.sample
    next_word = data[current_word].sample
    holder = [current_word, next_word]

    until next_word.match(TERMINATORS)
      current_word = next_word
      next_word = data[current_word].sample

      holder << next_word
    end

    holder.join(' ').capitalize.gsub(SPACED_PUNCTUATORS, '\1')
  end
end
