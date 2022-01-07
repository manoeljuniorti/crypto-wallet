class CreateDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :descriptions do |t|
      t.string :acronym
      t.string :url_image

      t.timestamps
    end
  end
end
