require 'bundler'
require 'pry'
Bundler.require

require_relative '../lib/student'

DB = {:conn => SQLite3::Database.new("db/students.db")}

# 
# josh = Student.new("Josh", 9)
#
# binding.pry
