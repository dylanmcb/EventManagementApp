# db/migrate/20231201150305_add_devise_to_users.rb
class AddDeviseToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      ## Database authenticatable
      unless column_exists?(:users, :email)
        t.string :email, null: false, default: ""
      end
      unless column_exists?(:users, :encrypted_password)
        t.string :encrypted_password, null: false, default: ""
      end

      # ... other Devise columns ...

      ## Recoverable
      unless column_exists?(:users, :reset_password_token)
        t.string   :reset_password_token
      end
      unless column_exists?(:users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      # ... other Devise columns ...

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    # ... other Devise indices ...
  end
end
