class AddQualificationToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :qualification, :string
  end
end
