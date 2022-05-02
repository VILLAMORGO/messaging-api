class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversation, index: true
      t.references :user, index: true
      t.string :sender_name
      t.string :sender_email
      t.string :image
      t.boolean :read, :default => false

      t.timestamps
    end
  end
end
