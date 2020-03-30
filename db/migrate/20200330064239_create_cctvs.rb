class CreateCctvs < ActiveRecord::Migration[5.2]
  def change
    create_table :cctvs do |t|
      t.string :ip
      t.string :title
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
