class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :orgname
      t.integer :jurisdiction
      t.string :city
      t.string :state
      t.text :function

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
