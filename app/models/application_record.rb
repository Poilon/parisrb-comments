class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.visible_for(*)
    all
  end

  def self.writable_by(*)
    all
  end

end
