module BicycleOrm
  module Connection
    def db_adapter
      BicycleOrm::DatabaseGlue.new(klass).connection
    end

    private

    def klass
      (self.is_a? Class) ? self : self.class
    end
  end
end
