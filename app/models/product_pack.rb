class ProductPack < ActiveRecord::Base
  attr_accessible :name, :slug, :percent, :published

  translates :name, :slug, :fallbacks_for_empty_translations => true
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :product_pack_id

    attr_accessible  :name, :slug

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

  has_one :product, inverse_of: :product_pack
  attr_accessible :product_id

  def product_id
    self.product.try :id
  end
  def product_id=(id)
    self.product = Product.find_by_id(id)
  end

  has_and_belongs_to_many :decors, join_table: 'decor_packs'
  attr_accessible :decors
  attr_accessible :decor_ids

  has_and_belongs_to_many :drink_sets, join_table: 'set_packs'
  attr_accessible :drink_sets
  attr_accessible :drink_set_ids

  before_validation :generate_slug
  def generate_slug
    self.slug = name.parameterize
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
    navigation_label 'Каталог'
    label 'Комплект'
    label_plural 'Комплекти'
    weight 4

    list do
      field :name do
        label 'Назва'
      end
      field :slug do
        label 'Назва'
      end
      field :percent do
        label 'Ціна'
      end
      field :published do
        label 'Активний?'
      end
      field :product do
        label 'Скатертина'
        help ''
      end
    end

    edit do
      field :translations, :globalize_tabs do
        label 'Локалізації'
        help 'Переклад'
      end
      field :percent do
        label 'Знижка'
        help 'Вказується лише число знижки.'
      end
      field :published do
        label 'Чи активний'
        help 'Не активний комплект  відображатись не буде.'
      end
      field :product do
        label 'Скатертина'
        help ''
      end
      field :decors do
        label 'Декор'
        help ''
      end
      field :drink_sets do
        label 'Сервіз'
        help ''
      end
    end
  end


end
