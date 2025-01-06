class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.text :description
      t.integer :upvotes

      t.timestamps
    end
  end
end
