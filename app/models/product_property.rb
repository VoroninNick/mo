class ProductProperty < ActiveRecord::Base
  attr_accessible :pp_key, :pp_value, :is_active_property

  translates :pp_key, :pp_value, :fallbacks_for_empty_translations => true
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :product_property_id

    attr_accessible  :pp_key, :pp_value

    rails_admin do
      visible false
      nested do
        field :locale , :hidden
        field :pp_key do
          label 'Назва'
          help ''
        end
        field :pp_value do
          label 'Значення'
          help ''
        end
      end
    end
  end
  rails_admin do
    navigation_label 'Каталог'
    label 'Властивість'
    label_plural 'Властивості'
    weight 6

    list do
      field :pp_key do
        label 'Назва'
      end
      field :pp_value do
        label 'Значення'
      end
      field :is_active_set do
        label 'Активний?'
      end
    end

    edit do
      field :translations, :globalize_tabs do
        label 'Локалізації'
        help 'Переклад'
      end
      field :is_active_set do
        label 'Чи активний'
        help 'Не активний комплект  відображатись не буде.'
      end
    end
  end
end
