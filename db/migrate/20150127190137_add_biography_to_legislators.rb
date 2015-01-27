class AddBiographyToLegislators < ActiveRecord::Migration
  def change
    add_column :legislators, :biography, :text
  end
end
