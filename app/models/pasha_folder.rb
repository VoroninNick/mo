class PashaFolder < ActiveRecord::Base
  translates :name, :content
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  attr_accessible :content

  has_one :pasha_file

  attr_accessible :name, :pasha_file, :pasha_file_id

  class Translation
    attr_accessible :locale, :name, :content

    rails_admin do
      field :locale, :hidden
      field :name
      field :content
    end
  end
  rails_admin do
    edit do
      field :pasha_file, :has_one_association do

      end
    end
  end
end
