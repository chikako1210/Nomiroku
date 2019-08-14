class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum sex: { 男: 0, 女: 1, その他: 2 }

  has_many :reviews, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  validates :name, presence: true, length: { minimum: 1, maximum: 15 }
  validates :profile, length: { maximum: 50 }

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  # attr_accessor :current_password

end