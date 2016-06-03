class CreateLabelings < ActiveRecord::Migration
  def change
    create_table :labelings do |t|
      t.belongs_to :label, index: true, foreign_key: true
      t.belongs_to :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
