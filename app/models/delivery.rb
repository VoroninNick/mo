class Delivery < ActiveRecord::Base
  attr_accessible :name, :slug, :description, :published

  translates :name, :slug, :description, :fallbacks_for_empty_translations => true
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :delivery_id

    attr_accessible :name, :slug, :description

    rails_admin do
      visible false
      nested do
        field :locale , :hidden
        field :name do
          label 'назва:'
          help ''
        end
        # field :slug do
        #   label 'транслітерація:'
        #   help ''
        # end
        field :description, :ck_editor do
          label 'текст сторінки:'
          help ''
        end
      end
    end
  end



  rails_admin do
    navigation_label 'Сторінки:'
    label 'Доставка'
    label_plural 'Доставка'

    edit do
      field :published do
        label 'опубліковано?'
      end
      field :translations, :globalize_tabs do
        label 'локалізації:'
      end
    end
  end
end
