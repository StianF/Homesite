class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :title_en
      t.string :title_no
      t.datetime :from
      t.datetime :to
      t.boolean :current
      t.text :description_no
      t.text :description_en

      t.timestamps
    end
  end
end
