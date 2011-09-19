class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :title_en
      t.string :title_no
      t.datetime :from
      t.datetime :to
      t.boolean :current
      t.text :decription_no
      t.text :description_en

      t.timestamps
    end
  end
end
