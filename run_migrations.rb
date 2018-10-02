#!/bin/ruby

require "sequel"
require_relative "store"

include PC::Base::Store

Sequel.extension :migration
Sequel::Migrator.run(db, "migrations")
