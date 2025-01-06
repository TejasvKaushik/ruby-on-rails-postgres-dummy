class AddContentToAnswers < ActiveRecord::Migration[8.0]
  def change
    add_column :answers, :content, :string
  end
end
