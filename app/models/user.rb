class User < ActiveRecord::Base

  validates :name, presence: true, on: :update

  has_many :notes

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

end
