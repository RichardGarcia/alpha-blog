class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
    end
  end
end


# t.string :title
# t.text :description