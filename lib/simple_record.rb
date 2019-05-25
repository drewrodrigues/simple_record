require_relative "pluralize"
require "sqlite3"
require "byebug"

class SimpleRecord
  DB = SQLite3::Database.open "time_alloc.db"
  TABLES = {
    "Event" => "events"
  }

  # adds the instance to class instances
  # @param instance of class
  def self.add(instance)
    instance.id = assign_next_id
    all << instance
  end

  # @return true or nil
  def self.delete(id)
    all.reject! { |i| i.id == id }
  end

  # @param [Integer] id of instance
  # @return first instance found with id
  def self.find(id)
    all.detect { |i| i.id == id }
  end

  # @return [Integer] instance count
  def self.count
    all.count
  end

  # @return all instances of class
  def self.all
    # @instances
    rows = DB.execute <<-SQL
      SELECT * FROM categories
    SQL
    byebug
    rows.map { |row| Category.new(*row) }
  end

  attr_accessor :id
end
