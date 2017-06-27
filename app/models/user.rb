require 'securerandom'
class User < ActiveRecord::Base
  before_create :set_auth_token
  has_many :notes


  private
    def set_auth_token
      return if auth_token.present?
      self.auth_token = generate_auth_token
      self.token_created_at = DateTime.now
    end

    def generate_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
