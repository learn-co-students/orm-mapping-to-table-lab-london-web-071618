require 'pry'
require 'bundler'
Bundler.require

require_relative '../lib/student'

DB = {:conn => SQLite3::Database.new("db/students.db")}
#
# Student.create_table
# josh = Student.new("Josh", "9th")
# # josh.save
#
# binding.pry 'start'
