class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string  :title
      t.text    :content, null: false
      t.string  :note_type, null: false,    default: "note"
      t.string  :color
      t.integer :user_id, null: false
      t.boolean :clipped,  default: false
      t.timestamps
    end
  end
end
