module Friendly
  class DataStore
    attr_reader :database

    def initialize(database)
      @database = database
    end

    def insert(persistable, attributes)
      dataset(persistable).insert(attributes)
    end

    def all(persistable, conditions)
      dataset(persistable).where(conditions).map
    end

    protected
      def dataset(persistable)
        database.from(persistable.table_name)
      end
  end
end
