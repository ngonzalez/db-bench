module PC
  module Base
    module Store
      def db
        @@db ||= setup_db_connection
      end

      def setup_db_connection
        options = {
          :database => ENV['SQL_NAME'],
          :user     => ENV['SQL_USERNAME'],
          :password => ENV['SQL_PASSWORD'],
          :host     => ENV['SQL_HOST'],
          :port     => ENV['SQL_PORT'],
        }

        db = Sequel.postgres(options)
        db.extension(:pg_json)

        if ENV['ENABLE_DB_CONNECTION_VALIDATOR'] == 'enabled'
          db.extension(:connection_validator)
          db.pool.connection_validation_timeout = ENV['DB_CONNECTION_VALIDATOR_TIMEOUT'].to_i
          puts "Database connection_validator enabled"
          puts "connection_validation_timeout=#{db.pool.connection_validation_timeout}"
        else
          puts "Database connection_validator disabled"
        end

        return db
      end
    end
  end
end
