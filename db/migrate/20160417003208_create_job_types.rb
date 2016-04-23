class CreateJobTypes < ActiveRecord::Migration
  def change
    create_table :job_types do |t|
      t.string :title
      t.string :slug

      t.timestamps null: false
    end
  end
end
