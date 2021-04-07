require 'benchmark'
require_relative 'my_algorithm'
require_relative 'my_algorithm_recursion'

string = 'applepenapplemycodeapplepenapplemycodeapplepenapplemycodeapplepenapplemycodeapplepenapplemycodeapplepenapplemycodeapplepenapplemycodeapplepenapplemycodeapplepenapplemycode'
dict = %w[apple pen other my code other]

my_algorithm = MyAlgorithm.new(string, dict)
my_algorithm_recursion = MyAlgorithmRecursion.new(string, dict)

n = 500_000

Benchmark.bm do |benchmark|
  benchmark.report("first approach  (without recursion)") do
    n.times do
      my_algorithm.valid?
    end
  end

  benchmark.report("second approach (with recursion)   ") do
    n.times do
      my_algorithm_recursion.valid?
    end
  end
end

