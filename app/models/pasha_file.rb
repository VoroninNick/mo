class PashaFile < ActiveRecord::Base
  belongs_to :pasha_folder

  attr_accessible :pasha_folder
  attr_accessible :pasha_folder_id
  attr_accessible :name
  attr_accessible :content

  rails_admin do
    field :name
    field :pasha_folder
  end

end
