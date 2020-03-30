class Cctv < ApplicationRecord
    validates :ip, presence: true
    validates :username, presence: true
    validates :password, presence: true
end
