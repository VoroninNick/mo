class ProductSet < ActiveRecord::Base
  attr_accessible :name, :percent, :is_active_set, :product, :product_id

  translates :name, :fallbacks_for_empty_translations => true
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :product_set_id

    attr_accessible  :name

    rails_admin do
      visible false
      nested do
        field :locale , :hidden
        field :name do
          label 'Назва'
          help ''
        end
      end
    end
  end

  validates_presence_of :name, :message => "Заповніть це поле! Поле не може бути пустим."

  has_many :photo_galleries, as: :imageable
  attr_accessible :photo_galleries
  accepts_nested_attributes_for :photo_galleries
  attr_accessible :photo_galleries_attributes

  has_one :product#, inverse_of: :product_set

  has_many :decor, inverse_of: :product_set
  attr_accessible :decors

  has_many :drink_set, inverse_of: :product_set


  rails_admin do
    navigation_label 'Каталог'
    label 'Комплект'
    label_plural 'Комплекти'
    weight 4

    list do
      field :name do
        label 'Назва'
      end
      field :percent do
        label 'Ціна'
      end
      field :is_active_set do
        label 'Активний?'
      end
      field :product do
        label 'Скатертина'
        help ''
      end
    end

    # edit do
    #   field :translations, :globalize_tabs do
    #     label 'Локалізації'
    #     help 'Переклад'
    #   end
    #   field :percent do
    #     label 'Знижка'
    #     help 'Вказується лише число знижки.'
    #   end
    #   field :is_active_set do
    #     label 'Чи активний'
    #     help 'Не активний комплект  відображатись не буде.'
    #   end
    #   field :product do
    #     label 'Скатертина'
    #     help ''
    #   end
    #   field :decor do
    #     label 'Декор'
    #     help ''
    #   end
    #   field :drink_set do
    #     label 'Сервіз'
    #     help ''
    #   end
    # end
  end
end
