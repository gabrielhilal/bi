class MyAlgorithm
  def initialize(word, dict)
    @word = word
    @dict = dict
  end

  def valid?
    valid_segment?
  end

  private

  def valid_segment?
    segment = ''

    @word.chars.each do |char|
      segment << char
      next unless @dict.include?(segment)

      segment = ''
    end

    segment.empty?
  end
end
