class CreateTipoCorsos < ActiveRecord::Migration
  def change
    create_table :tipo_corsos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
