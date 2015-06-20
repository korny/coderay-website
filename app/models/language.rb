class Language < ActiveRecord::Base
  has_many :rays
  
  attr_accessible :name, :desc, :lang
end
