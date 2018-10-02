#!/bin/ruby

require "sequel"
require "simple_uuid"
require_relative "store"

include PC::Base::Store

payload = File.open("fixtures/payload.json").read

10_000.times do |i|
  uuid = SimpleUUID::UUID.new.to_guid
  db[:test_table].insert(
    id: uuid,
    value: "text-#{uuid}",
    payload: payload,
    created_at: Time.now,
    updated_at: Time.now
  )
end

exit
