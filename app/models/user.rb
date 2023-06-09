# app/models/user.rb
class User < ApplicationRecord
    # Include Devise modules for authentication
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    # Define the available roles for users
    enum role: { admin: 0, employee: 1, customer: 2 }
  
    # Validations
    validates :email, presence: true, uniqueness: true
  
    # Associations
    has_many :tasks
  
    # Custom methods for checking roles
    def admin?
      role == 'admin'
    end
  
    def employee?
      role == 'employee'
    end
  
    def customer?
      role == 'customer'
    end
  end
  