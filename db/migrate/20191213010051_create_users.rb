class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :major
      t.string :linkedin
      t.string :email
      t.string :gender
      t.string :ethnicity
      t.date :date_of_birth
      t.boolean :subscriber
      t.date :graduation_date
      t.boolean :board

      t.timestamps
    end
  end
end
