class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :name
      t.string :external_link
      t.string :desc
      t.integer :page_id

      t.timestamps
    end
    add_index :services, :page_id
    
  end

  def self.down
    drop_table :services
  end
end
