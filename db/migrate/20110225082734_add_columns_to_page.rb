class AddColumnsToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :leader, :string
    add_column :pages, :leader_title, :string
    add_column :pages, :budget, :float
    add_column :pages, :budget_year, :string
    add_column :pages, :rtiscore, :integer
    add_column :pages, :rtiaddress, :string
  end

  def self.down
    remove_column :pages, :budget_year
    remove_column :pages, :budget
    remove_column :pages, :leader_title
    remove_column :pages, :leader
    remove_column :pages, :rtiscore
    remove_column :pages, :rtiaddress
  end
end
