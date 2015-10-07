class AddConfirmableToUsers < ActiveRecord::Migration
  def up
  	# these commands are going to be executed when
  	# I will later run 
  	# rake db:migrate
  	change_table(:users) do |t|
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
    end

    add_index :users, :confirmation_token,   unique: true
  end

  def down
  	# these commands are going to be executed when
  	# I will later run
  	# rake db:rollback
  	remove_index :users, :confirmation_token
  	remove_column :users, :confirmation_token
  	remove_column :users, :confirmed_at
  	remove_column :users, :confirmation_sent_at
  end	
end