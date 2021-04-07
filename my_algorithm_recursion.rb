class MyAlgorithmRecursion
  def initialize(word, dict)
    @word = word
    @dict = dict
  end

  def valid?
    valid_segment?
  end

  private

  def valid_segment?(from = 0, to = 1, result: false)
    return result if to >= @word.size

    if @dict.include?(@word[from..to])
      valid_segment?(to + 1, to + 2, result: true)
    else
      valid_segment?(from, to + 1)
    end
  end
end
