module BicycleOrm
  class DatabaseGlue
    module Inflection
      def adapter_class
        "#{database_adapter}_adapter".classify
      end

      def bicycle_adapter
        "BicycleOrm::#{adapter_class}".constantize
      end

      def table_name
        klass_name.downcase.pluralize
      end
    end
  end
end
