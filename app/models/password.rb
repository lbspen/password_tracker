class Password < ActiveRecord::Base
  attr_accessible :password, :url, :username

  validates :url, :presence => true;
  validates :username, :presence => true;
  validates :password, :presence => true;

end
