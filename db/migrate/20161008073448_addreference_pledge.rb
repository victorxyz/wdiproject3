class AddreferencePledge < ActiveRecord::Migration[5.0]
  def change
      add_reference :individual_pledges, :total_pledge, foreign_key: true
  end
end
