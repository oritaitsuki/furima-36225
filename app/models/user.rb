class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :family_name
  end
  with_options presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' } do
    validates :read_first
    validates :read_family
  end
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :nickname, presence: true
  validates :birth, presence: true
end
