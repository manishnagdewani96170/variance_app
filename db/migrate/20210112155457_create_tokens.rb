class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string :auth_token, null: :false, index: :true
      t.timestamps
    end
  end
end
