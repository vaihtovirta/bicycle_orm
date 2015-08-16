require 'yaml'
require 'bicycle_orm/database_glue/inflection'
require 'bicycle_orm/database_glue/configuration'

module BicycleOrm
  class DatabaseGlue
    include BicycleOrm::DatabaseGlue::Inflection
    include BicycleOrm::DatabaseGlue::Configuration

    def initialize(klass)
      @klass = klass
    end

    def connection
      bicycle_adapter.new(database_name, table_name)
    end

    private

    def klass_name
      @klass.name
    end
  end
end
