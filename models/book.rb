class Book < ActiveRecord::Base
  belongs_to :library
  after_initialize :init

    def init
      self.in_stock  ||= true          
      self.added ||= Date.today 
    end

    scope :in, where(:in_stock => true)

end
