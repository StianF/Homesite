class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title_no
      t.string :title_en
      t.text :description_no
      t.text :description_en
      t.string :url
      t.datetime :date

      t.timestamps
    end
  end
end
