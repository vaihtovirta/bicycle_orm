require 'sqlite3'

module BicycleOrm
  class Sqlite3Adapter
    attr_reader :column_names

    def initialize(db, table)
      @db = connection(db)
      @table = table
      @column_names = columns
    end

    def find(id)
      record = @db.execute %( select * from #{@table} where Id = #{id} )

      record_not_found if record.empty?

      record_to_hash(record)
    end

    def create(attributes)
      keys = attributes.keys.join(', ')
      values = attributes.values.map { |value| "'#{value}'" } * ', '

      @db.execute %( insert into #{@table} (#{keys}) values (#{values}) )
    end

    def find_by(hash)
      record = @db.execute %( select * from #{@table}
                              where #{hash.keys.join} = '#{hash.values.join}'
                              limit 1 )

      record_not_found if record.empty?

      record_to_hash(record)
    end

    def delete!(id)
      @db.execute %( delete from #{@table} where Id = #{id} )
    end

    def count
      count = @db.execute %( select Count(Id) from #{@table} )
      count.flatten.join.to_i
    end

    private

    def record_to_hash(record)
      Hash[column_names.map(&:to_sym).zip record.flatten!]
    end

    def columns
      (@db.execute %( PRAGMA table_info(#{@table}) )).map { |item| item[1] }
    end

    def record_not_found
      fail BicycleOrm::AdapterRecordNotFound, 'record not found'
    end

    def connection(db)
      SQLite3::Database.new("#{db}.db")
    end
  end
end
