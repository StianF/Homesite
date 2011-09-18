class CreateEmployments < ActiveRecord::Migration
  def self.up
    create_table :employments do |t|
      t.string :company
      t.datetime :from
      t.datetime :to
      t.string :title
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :employments
  end
end
