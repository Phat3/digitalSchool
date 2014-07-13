class CreateClasses < ActiveRecord::Migration


  def change
    create_table :classes do |t|
      t.string :orario
      t.string :nome
      t.references :piano
      t.timestamps
    end
  end
end
