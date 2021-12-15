class Order < ApplicationRecord
    validates :first_name, presence: true 
    validates :last_name, presence: true 
    validates :patronymic, presence: true 
    validates :phone_number, presence: true 
    validates :email, presence: true 
    validates :weight, presence: true 
    validates :lenght, presence: true 
    validates :width, presence: true 
    validates :height, presence: true 
    validates :from, presence: true 
    validates :to, presence: true 
    validates :distance, presence: true 
    validates :price, presence: true 
end
