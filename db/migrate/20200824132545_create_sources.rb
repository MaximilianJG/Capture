class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :title
      t.string :website
      t.date :date_of_article
      t.datetime :date_time_of_save
      t.string :url_of_website
      t.references :user, null: false, foreign_key: true
      t.references :folder, foreign_key: true

      t.timestamps
    end
  end
end
