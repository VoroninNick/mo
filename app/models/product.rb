class Product < ActiveRecord::Base
  attr_accessible :name, :price, :short_description, :description, :image, :count_items, :category_id, :promotion_id
  attr_accessible :promotion_price
  attr_accessible :product_pack_id, :product_pack

  translates :name, :short_description, :description, :t_name, :fallbacks_for_empty_translations => true
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :product_id

    attr_accessible  :name, :short_description, :description, :t_name

    rails_admin do
      visible false
      nested do
        field :locale , :hidden
        field :name do
          label 'Назва'
          help ''
        end
        field :short_description do
          label 'Короткий опис'
          help ''
        end
        field :description, :ck_editor do
          label 'Повний опис'
          help ''
        end
      end


    end
  end

  validates_presence_of :name, :message => "Заповніть це поле! Поле не може бути пустим."
  validates_presence_of :image, :message => "Виберіть фотографію, відповідно до зазначених розмірів! Поле не може бути пустим."
  validates_presence_of :short_description, :message => "Заповніть це поле! Поле не може бути пустим."
  validates_presence_of :description, :message => "Заповніть це поле! Поле не може бути пустим."

  has_attached_file :image,
                    styles: { thumb: "300x300#", large: "600x600>" },
                    convert_options: { thumb: "-quality 94 -interlace Plane",
                                       large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/:id/image_:style.:extension",
                    path:':rails_root/public:url'

  belongs_to :category, inverse_of: :products
  belongs_to :promotion, inverse_of: :products

  has_many :photo_galleries, as: :imageable
  attr_accessible :photo_galleries
  accepts_nested_attributes_for :photo_galleries, allow_destroy: true
  attr_accessible :photo_galleries_attributes

  has_many :product_properties, as: :characteristic
  attr_accessible :product_properties
  accepts_nested_attributes_for :product_properties, allow_destroy: true
  attr_accessible :product_properties_attributes

  belongs_to :product_pack, inverse_of: :product

  before_validation :generate_t_name
  def generate_t_name
    self.t_name = name.parameterize
  end

  # line item block begin

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

  # line item block end

  rails_admin do
    parent Category
    label 'Одиниця'
    label_plural 'Одиниці'

    list do
      field :category_id do
        label 'Категорія'
      end
      field :image do
        label 'Зображення'
      end
      field :name do
        label 'Назва'
      end
      field :t_name do
        label 'Транслітерація'
      end
      field :price do
        label 'Ціна'
      end
      field :promotion_price do
        label 'Акційна ціна'
      end
      field :count_items do
        label 'Кількість'
      end
    end

    edit do
      field :image, :paperclip do
        label 'Зображення'
        help 'Зображення для альбому повинне бути 600. / 600px.'
      end
      field :price do
        label 'Ціна'
        help ''
      end
      field :promotion_price do
        label 'Акційна ціна'
        help 'Якщо вводиться "акційна ціна, продукт буде мати іконку розпродаж.'
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
      field :product_properties do
        label 'Властивості'
      end
      field :category do
        label 'Категорія'
        help 'Виберіть категорію до якої належить товар.'
      end
      field :promotion do
        label 'Акція'
        help ''
      end
    end
  end
end
