class Education < ActiveRecord::Base
  def from_to_str
    "#{self.from.strftime("%Y %b")} - "+((self.current)?((I18n.locale.to_s == 'no')?"Naa":"Now"):"#{self.to.strftime("%Y %b")}")
  end

end
