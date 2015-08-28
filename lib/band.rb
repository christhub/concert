class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  before_save :upcase_everything


  private

  def upcase_everything
    self.name = name.capitalize
  end

end
