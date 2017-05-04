class AddColumnsInUsers < ActiveRecord::Migration[5.0]
  def change
    add_column  :users, :first_name,	:string,  null: false, default: ""
    add_column  :users, :middle_name,	:string,  null: false, default: ""
    add_column  :users, :last_name,		:string,  null: false, default: ""
    add_column  :users, :mobile,			:string,  null: false, default: ""
    add_column  :users, :dob,					:date
  end
end
