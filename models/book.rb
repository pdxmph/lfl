class Book < ActiveRecord::Base
  belongs_to :library

  after_initialize :init

    def init
      self.in_stock  ||= true           #will set the default value only if it's nil
      self.added ||= Date.today #let's you set a default association
    end

end
