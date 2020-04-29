require_relative '../lib/test.rb'

test = Test.new('../src/style1.css')

error = test.run_test

puts error.empty? ? '1 files inspected, no offenses detected' : error
