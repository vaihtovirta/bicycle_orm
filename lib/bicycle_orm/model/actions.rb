module BicycleOrm
  class Model
    module Actions
      include BicycleOrm::Connection

      def find(id)
        attributes = db_adapter.find(id)

        record_not_found { new attributes }
      end

      def column_names
        db_adapter.column_names
      end

      def create(attributes)
        db_adapter.create(attributes)
      end

      def find_by(hash)
        attributes = db_adapter.find_by(hash)

        record_not_found { new attributes }
      end

      def count
        db_adapter.count
      end

      private

      def record_not_found
        yield
      rescue ModelRecordNotFound
        'record cannot be found'
      end
    end
  end
end
