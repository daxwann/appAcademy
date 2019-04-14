require 'active_support/inflector'
require_relative './questions_database'

class ModelBase
  def self.table
    self.to_s.tableize
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id: id)
      SELECT
        *
      FROM
        #{self.table}
      WHERE
        id = :id
    SQL

    data.empty? ? nil : self.new(data.first)
  end

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table}
    SQL

    parse_all(data)
  end

  def self.parse_all(data)
    data.map { |datum| self.new(datum) }
  end

  def self.where(params)
    if params.is_a?(Hash)
      conditions = params.keys.map { |key| "#{key} = ?" }.join(" AND ")
      vals = params.values
    else
      conditions = params
      vals = []
    end

    data = QuestionsDatabase.instance.execute(<<-SQL, *vals)
      SELECT
        *
      FROM
        #{self.table}
      WHERE
        #{conditions}
    SQL

    parse_all(data)
  end

  def self.find_by(params)
    self.where(params)
  end

  def save
    @id ? update : create
  end

  def get_attrs
    attrs = Hash.new
    self.instance_variables.each do |name|
      attrs[name.to_s[1..-1]] = self.instance_variable_get(name)
    end

    return attrs
  end

  def create
    raise "#{self} already in database" unless @id.nil?

    attrs = self.get_attrs
    attrs.delete("id")
    col_names = attrs.keys.join(", ")
    question_marks = Array.new(attrs.count, "?").join(", ")
    values = attrs.values

    QuestionsDatabase.instance.execute(<<-SQL, *values)
      INSERT INTO
        #{self.class.table} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    @id = QuestionsDatabase.instance.last_insert_row_id
  end 

  def update
    raise "#{self} is not in database" if @id.nil?

    attrs = self.get_attrs
    attrs.delete("id")
    values = attrs.values
    set_line = attrs.keys.map { |name| "#{name} = ?" }.join(", ")

    QuestionsDatabase.instance.execute(<<-SQL, *values, @id)
      UPDATE
        #{self.class.table}
      SET
        #{set_line}
      WHERE
        id = ?
    SQL

    self
  end
end
