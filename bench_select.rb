#!/bin/ruby

require "sequel"
require_relative "store"

include PC::Base::Store

1_000.times do |i|
  db[:test_table].order(Sequel.lit('RANDOM()')).limit(10).all
end

exit
