class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy

  scope :gender, -> gender { where(:gender => gender) }
  scope :age, -> age { where("age < ?", age) }

end
