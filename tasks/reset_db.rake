require 'sqlite3'

desc 'Create test db with some data or reset it if it exists'
task :reset_db do
  db_name = 'test.db'

  File.delete(db_name) if File.exist?(db_name)

  db = SQLite3::Database.new('test.db')

  db.execute <<-SQL
    create table users (
      id integer primary key,
      name varchar(30)
    );
  SQL

  %w(Friedrich Albert Franz).each do |name|
    db.execute 'insert into users (name) values ( ? )', name
  end
end
