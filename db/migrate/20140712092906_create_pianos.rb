class CreatePianos < ActiveRecord::Migration
  def change
    create_table :pianos do |t|
      t.string :nome
      t.text :descrizione

      t.timestamps
    end
  end
end
