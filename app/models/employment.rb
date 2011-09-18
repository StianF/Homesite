class Employment < ActiveRecord::Base
  attr_accessible :company, :from, :to, :title, :description
end
