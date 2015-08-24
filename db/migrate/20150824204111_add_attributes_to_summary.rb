class AddAttributesToSummary < ActiveRecord::Migration
  def change
    change_table :summaries do |t|
      t.string :short_title
      t.string :short_body
    end
  end
end
