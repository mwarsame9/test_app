class Quote < ActiveRecord::Base
  validates :author, :content, presence: true

  scope :search, -> (name_parameter) { where("author like ?", "%#{name_parameter}%")}
end
