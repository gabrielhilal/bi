require_relative 'my_algorithm'
require_relative 'my_algorithm_recursion'

RSpec.shared_context 'scenarios' do
  describe '#valid?' do
    context 'when string has two valid words in sequence' do
      let(:string) { 'mycode' }
      let(:dict)   { %w[my code other] }

      it 'returns true' do
        expect(subject).to be true
      end
    end

    context 'when string has segment not included in the dictionary' do
      let(:string) { 'mycodehello' }
      let(:dict)   { %w[my code other] }

      it 'returns false' do
        expect(subject).to be false
      end
    end

    context 'when string has repeated words (reuse dictionary)' do
      let(:string) { 'applepenapple' }
      let(:dict)   { %w[apple pen] }

      it 'returns true' do
        expect(subject).to be true
      end
    end
  end
end

RSpec.describe MyAlgorithm do
  subject { described_class.new(string, dict).valid? }

  include_context 'scenarios'
end

RSpec.describe MyAlgorithmRecursion do
  subject { described_class.new(string, dict).valid? }

  include_context 'scenarios'
end
