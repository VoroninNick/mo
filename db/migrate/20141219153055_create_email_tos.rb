class CreateEmailTos < ActiveRecord::Migration
  def change
    create_table :email_tos do |t|
      t.string :customized_form
      t.string :order_product_from
      t.string :feedback_form
      t.string :call_order_form

      t.timestamps
    end
  end
end
