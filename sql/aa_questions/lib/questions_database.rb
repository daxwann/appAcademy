require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  
  DB_FILE = File.join(File.dirname(__FILE__), 'questions.db')
  SQL_FILE = File.join(File.dirname(__FILE__), 'import_db.sql')

  def initialize
    super(DB_FILE)
    self.type_translation = true
    self.results_as_hash = true
  end 

  def reset!
    system("rm", DB_FILE)
    system("cat #{SQL_FILE} | sqlite3 #{DB_FILE}") 
  end
end

