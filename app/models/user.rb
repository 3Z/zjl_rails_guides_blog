class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  has_many :photos, dependent: :destroy

  #url like http://localhost:3000/users/?haha_age=50&by_gender=1
  #:by_gender is the param name in url, gender is the param value, :gender is the column name of this model
  scope :by_gender, -> gender { where(:gender => gender) }
  # scope :by_gender, -> gender { where("gender = ?", gender) }
  scope :haha_age, -> age { where("age < ?", age) }

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/grace.jpg"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

end
