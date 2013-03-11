class CreateSpecs < ActiveRecord::Migration
  def self.up
    create_table "specs", :force => true do |t|
      t.integer "user_id", :limit => 11, :null => false
      t.string  "first_name", :default => ""
      t.string  "last_name",  :default => ""
      t.string  "gender"
      t.date    "birthdate"
      t.string  "occupation", :default => ""
      t.string  "city",       :default => ""
      t.string  "state",      :default => ""
      t.string  "zip_code",   :default => ""
    end
  end

  def self.down
    drop_table :specs
  end
end
