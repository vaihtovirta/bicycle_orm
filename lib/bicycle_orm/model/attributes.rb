module BicycleOrm
  class Model
    module Attributes
      DEFAULT_ATTRIBUTES = %i(id)

      def fields(*fields)
        fields.concat(DEFAULT_ATTRIBUTES).each do |field|
          define_method(field) { self[field] }
        end
      end
    end
  end
end
