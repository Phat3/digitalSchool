class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :nome
      t.string :data
      t.text :descrizione

      t.timestamps
    end
  end
end
