Sequel.migration do
  up do
    create_table(:test_table) do
      column :id, :uuid, :null => false, :primary_key => true, :unique => true
      column :value,  String, :null => false
      column :payload, :json, :null => false
      column :created_at, DateTime, :null => false, :default => Sequel.function(:now)
      column :updated_at, DateTime, :null => false, :default => Sequel.function(:now)
      index [:id], :unique => true
      index [:value]
      index [:created_at]
      index [:updated_at]
    end
  end
  down do
    drop_table(:test_table)
  end
end
