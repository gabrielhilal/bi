class MyAlgorithm
  def initialize(word, dict)
    @word = word
    @dict = dict
  end

  def valid?
    match_all_words?
  end

  private

  def match_all_words?
    grouped_words.values.all? { |w| @dict.include?(w) }
  end

  def grouped_words
    index = 0

    @word.chars.each_with_object(Hash.new('')) do |char, hash|
      hash[index] += char
      next unless @dict.include?(hash[index])

      index += 1
    end
  end
end
