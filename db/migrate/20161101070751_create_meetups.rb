class CreateMeetups < ActiveRecord::Migration[5.0]
  def change
    create_table :meetups do |t|
      t.string :title
      t.datetime :date
      t.string :address
      t.text :content
      t.belongs_to :user, foreign_key: true
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
