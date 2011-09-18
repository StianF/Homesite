class Employment < ActiveRecord::Base
  def from_to_str
    "#{self.from.strftime("%Y %b")} - "+((self.current)?"Now":"#{self.to.strftime("%Y %b")}")
  end
end
