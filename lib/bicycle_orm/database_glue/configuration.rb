module BicycleOrm
  class DatabaseGlue
    module Configuration
      def database_name
        configuration['database']
      end

      def database_adapter
        configuration['adapter']
      end

      private

      def config_file
        File.open('config/database.yml')
      end

      def configuration
        YAML.load(config_file)
      end
    end
  end
end
