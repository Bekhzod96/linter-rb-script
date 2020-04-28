require_relative '../lib/test.rb'

test = Test.new('../src/style.css')

p test.run_test
