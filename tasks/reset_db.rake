require 'sqlite3'

desc 'Create test db with some data or reset it if it exists'
task :reset_db do
  db_name = 'test.db'

  File.delete(db_name) if File.exist?(db_name)

  db = SQLite3::Database.new('test.db')

  db.execute <<-SQL
    create table users (
      id integer primary key,
      name varchar(30),
      occupation varchar(30),
      age integer
    );
  SQL

  people = [%w(Friedrich philosopher 55),
            %w(Albert physicist 76),
            %w(Franz writer 40)]

  people.each do |triple|
    db.execute %( insert into users (name, occupation, age)
                  values ( '#{triple[0]}', '#{triple[1]}', '#{triple[2]}') )
  end
end
