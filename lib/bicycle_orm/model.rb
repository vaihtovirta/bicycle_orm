require 'bicycle_orm/model/actions'
require 'bicycle_orm/model/attributes'

module BicycleOrm
  class Model
    include BicycleOrm::Connection
    extend BicycleOrm::Model::Actions
    extend BicycleOrm::Model::Attributes

    def initialize(attributes = nil)
      @attributes = attributes
    end

    def [](name)
      @attributes[name]
    end

    def delete!
      db_adapter.delete!(id)
      @attributes = {}
    end
  end
end
