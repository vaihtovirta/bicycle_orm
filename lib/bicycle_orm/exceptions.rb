module BicycleOrm
  class Error < ::StandardError
  end

  DatabaseError = Class.new(Error)

  AdapterError = Class.new(Error)

  AdapterRecordNotFound = Class.new(AdapterError)

  ModelError = Class.new(Error)

  ModelRecordNotFound = Class.new(ModelError)
end
