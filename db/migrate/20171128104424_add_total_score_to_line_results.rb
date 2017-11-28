class AddTotalScoreToLineResults < ActiveRecord::Migration[5.1]
  def change
    add_column :line_results, :total_score, :float
  end
end
