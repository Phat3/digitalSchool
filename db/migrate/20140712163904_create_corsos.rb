class CreateCorsos < ActiveRecord::Migration
  def change
    create_table :corsos do |t|
      t.string :nome
      t.text :descrizione
      t.references :insegnante
      t.references :classe
      t.references :piano
      t.timestamps
    end
  end
end
