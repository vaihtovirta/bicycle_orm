require 'yaml'

module BicycleOrm
  class DBAdapter
    def initialize(klass)
      @klass = klass
    end

    def to_adapter
      bicycle_adapter.new(db_name, table_name)
    end

    private

    def config_file
      File.open('config/database.yml')
    end

    def configuration
      YAML.load(config_file)
    end

    def db_name
      configuration['database']
    end

    def db_adapter
      configuration['adapter']
    end

    def adapter_class
      "#{db_adapter}_adapter".classify
    end

    def bicycle_adapter
      "BicycleOrm::#{adapter_class}".constantize
    end

    def table_name
      @klass.name.downcase.pluralize
    end
  end
end
