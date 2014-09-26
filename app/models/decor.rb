class Decor < ActiveRecord::Base
  attr_accessible :name, :t_name, :price, :new_price, :short_description, :description, :image, :count_items, :d_category_id
  attr_accessible :product_set_id
  attr_accessible :product_pack_id, :product_pack

  translates :name, :short_description, :description, :t_name, :fallbacks_for_empty_translations => true
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :decor_id

    attr_accessible  :name, :short_description, :description, :t_name

    rails_admin do
      visible false
      nested do
        field :locale , :hidden
        field :name do
          label 'Заголовок'
          help ''
        end
        field :short_description do
          label 'Короткий опис'
          help ''
        end
        field :description, :ck_editor do
          label 'Текст публікації'
          help ''
        end
      end


    end
  end

  validates_presence_of :name, :message => "Заповніть це поле! Поле не може бути пустим."
  # validates_presence_of :image, :message => "Виберіть фотографію, відповідно до зазначених розмірів! Поле не може бути пустим."
  validates_presence_of :short_description, :message => "Заповніть це поле! Поле не може бути пустим."
  validates_presence_of :description, :message => "Заповніть це поле! Поле не може бути пустим."

  has_attached_file :image,
                    styles: { thumb: "300x300#", large: "600x600>" },
                    convert_options: { thumb: "-quality 94 -interlace Plane",
                                       large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/:id/image_:style.:extension",
                    path:':rails_root/public:url'

  belongs_to :d_category, inverse_of: :decors

  has_many :photo_galleries, as: :imageable
  attr_accessible :photo_galleries
  accepts_nested_attributes_for :photo_galleries
  attr_accessible :photo_galleries_attributes

  belongs_to :product_pack#, inverse_of: :decors

  before_validation :generate_t_name
  def generate_t_name
    self.t_name = name.parameterize
  end

  rails_admin do
    parent DCategory
    label 'Одиниця'
    label_plural 'Одиниці'

    list do
      field :d_category_id do
        label 'Категорія'
      end
      # field :image do
      #   label 'Зображення'
      # end
      field :name do
        label 'Назва'
      end
      field :t_name do
        label 'Транслітерація'
      end
      field :price do
        label 'Ціна'
      end
      field :new_price do
        label 'Нова ціна'
      end
      field :count_items do
        label 'Кількість'
      end
    end

    edit do
      # field :image, :paperclip do
      #   label 'Зображення'
      #   help 'Зображення для альбому повинне бути 600. / 600px.'
      # end
      field :price do
        label 'Ціна'
        help ''
      end
      field :new_price do
        label 'Нова ціна'
        help ''
      end
      field :count_items do
        label 'Кількість'
        help ''
      end
      field :translations, :globalize_tabs do
        label 'Локалізації'
      end
      field :photo_galleries do
        label 'Фотогалерея'
      end
      field :d_category do
        label 'Категорія'
        help 'Виберіть категорію до якої належить товар.'
      end
    end
  end
end
