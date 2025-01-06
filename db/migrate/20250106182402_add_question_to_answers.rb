class AddQuestionToAnswers < ActiveRecord::Migration[8.0]
  def change
    add_reference :answers, :question, null: false, foreign_key: true
  end
end
