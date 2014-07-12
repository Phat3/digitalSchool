class CreateInsegnantes < ActiveRecord::Migration
  def change
    create_table :insegnantes do |t|
      t.string :nome
      t.text :bio
      t.string :cv
      t.string :foto
      t.timestamps
    end
  end
end
