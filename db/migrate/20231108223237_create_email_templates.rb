class CreateEmailTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :email_templates do |t|

      t.string :name, null: false
      t.text :subject
      t.text :body, null: false

      t.timestamps
    end
  end
end
