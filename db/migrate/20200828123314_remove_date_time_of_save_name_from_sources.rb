class RemoveDateTimeOfSaveNameFromSources < ActiveRecord::Migration[6.0]
  def change
    remove_column :sources, :date_time_of_save, :datetime
  end
end
