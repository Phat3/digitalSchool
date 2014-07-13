class CreateMateriales < ActiveRecord::Migration
  def change
    create_table :materiales do |t|
      t.string :nome
      t.string :file
      t.string :tipo
      t.references :corso
      t.timestamps
    end
  end
end
