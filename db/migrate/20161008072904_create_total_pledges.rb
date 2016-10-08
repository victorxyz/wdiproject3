class CreateTotalPledges < ActiveRecord::Migration[5.0]
  def change
    create_table :total_pledges do |t|
      t.float :pledged_total

      t.timestamps
    end
  end
end
