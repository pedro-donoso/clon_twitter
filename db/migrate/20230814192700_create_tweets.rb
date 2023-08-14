class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.text :description
      t.string :userName

      t.timestamps
    end
  end
end
