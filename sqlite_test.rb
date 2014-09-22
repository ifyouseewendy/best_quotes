require 'sqlite3'
require 'rulers/sqlite_model'

puts '--> Test schema'
class MyTable < Rulers::Model::SQLite; end
STDERR.puts MyTable.schema.inspect

puts '--> Test create and count'
mt = MyTable.create 'title' => 'It happed!', 'posted' => 1, 'body' => 'It did!'
mt = MyTable.create 'title' => 'I saw it!'

puts "Count: #{MyTable.count}"

puts '--> Test find'
top_id = mt['id'].to_i
(1..top_id).each do |id|
  mt_id = MyTable.find(id)
  puts "Found title #{mt_id['title']}."
end

puts '--> Test save!'
mt = MyTable.create "title" => "I saw it again!"
mt['title'] = 'I really did!'
mt.save!

mt2 = MyTable.find mt['id']
puts "Title: #{mt2['title']}"

puts '--> Test column accessor'
MyTable.class_eval do
  def method_missing(name, *args, &block)
    self[name] rescue raise 'No column found'
  end
end
mt3 = MyTable.find mt['id']
puts mt3.id
