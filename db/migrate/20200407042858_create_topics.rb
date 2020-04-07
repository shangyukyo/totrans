class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.belongs_to  :admin_user
      t.string  :title, null: false
      t.string  :slug
      t.string  :keyword
      t.string  :origin
      t.integer :sort_number
      t.string  :seo_title
      t.string  :seo_keywords
      t.string  :seo_description      
      t.text    :body
      t.timestamps
    end
  end
end
