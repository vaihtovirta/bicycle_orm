require 'sqlite3'

module BicycleOrm
  class Sqlite3Adapter
    def initialize(db, table)
      @db = connection(db)
      @table = table
    end

    def find(id)
      record = @db.execute %( select * from #{@table} where Id = #{id} )

      record.empty? ? {} : Hash[column_names.map(&:to_sym).zip record.flatten!]
    end

    def column_names
      (@db.query %( select * from #{@table} )).columns
    end

    def create(attributes)
      keys = attributes.keys.join(', ')
      values = attributes.values.join(', ')

      @db.execute %( insert into #{@table} (#{keys}) values ('#{values}') )
    end

    def find_by(hash)
      record = @db.execute %( select * from #{@table}
                              where #{hash.keys.join} = '#{hash.values.join}'
                              limit 1 )
      Hash[column_names.map(&:to_sym).zip record.flatten!]
    end

    def delete!(id)
      @db.execute %( delete from #{@table} where Id = #{id} )
    end

    def count
      count = @db.execute %{ select Count(Id) from #{@table} }
      count.flatten.join.to_i
    end

    private

    def connection(db)
      SQLite3::Database.new("#{db}.db")
    end
  end
end
