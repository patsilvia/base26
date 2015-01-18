#!/usr/bin/env ruby

require_relative 'lib/base26'


#Main
n = Base26.new()

input = 'lina+luna'
puts "The result of #{input} is: #{n.run(input)}"
input = 'xv + da'
puts "The result of #{input} is: #{n.run(input)}"
