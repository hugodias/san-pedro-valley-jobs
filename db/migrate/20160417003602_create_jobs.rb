class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :salary
      t.string :location
      t.text :description
      t.text :how_to_apply
      t.references :job_type, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.integer :status
      t.string :author
      t.string :author_email
      t.string :slug

      t.timestamps null: false
    end
  end
end
