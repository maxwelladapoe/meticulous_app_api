class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :attachment_type
      t.belongs_to :note, null: false
      t.belongs_to :user, null: false
      t.string :size
      t.string :path, null: false
      t.timestamps
    end
  end
end
