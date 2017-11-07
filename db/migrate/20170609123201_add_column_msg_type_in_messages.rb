class AddColumnMsgTypeInMessages < ActiveRecord::Migration[5.0]

  def change
  	add_column :messages, :msg_type, :string
  end

end
