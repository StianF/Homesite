class CreateEmployments < ActiveRecord::Migration
  def self.up
    create_table :employments do |t|
      t.string :company
      t.datetime :from
      t.datetime :to
      t.boolean :current
      t.string :title_en
      t.string :title_no
      t.text :description_en
      t.text :description_no
      t.timestamps
    end
  end

  def self.down
    drop_table :employments
  end
end
