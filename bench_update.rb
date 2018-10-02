#!/bin/ruby

require "sequel"
require "simple_uuid"
require_relative "store"

include PC::Base::Store

records = db[:test_table].all

puts "Found %s records" % records.length

records.each do |record|
  uuid = SimpleUUID::UUID.new.to_guid
  record[:value] = "update-#{uuid}"
end

exit