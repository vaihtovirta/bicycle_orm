module BicycleOrm
  class Model
    def initialize(attributes = nil)
      @attributes = attributes
    end

    def [](name)
      @attributes[name]
    end

    def method_missing(name)
      return self[name] if self.class.column_names.include?(name.to_s)
      super
    end

    def delete!
      self.class.db_adapter.delete!(id)
      @attributes = {}
    end

    class << self
      def find(id)
        attributes = db_adapter.find(id)
        new attributes
      end

      def column_names
        db_adapter.column_names
      end

      def create(attributes)
        db_adapter.create(attributes)
      end

      def find_by(hash)
        attributes = db_adapter.find_by(hash)
        new attributes
      end

      def count
        db_adapter.count
      end

      def db_adapter
        BicycleOrm::DBAdapter.new(self).to_adapter
      end
    end
  end
end
