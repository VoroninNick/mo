class Category < ActiveRecord::Base
  attr_accessible :name, :icon, :image, :parent_id, :category_url, :child_category_id

  # belongs_to :category
  # has_many :children, :dependent => :destroy, :class_name => 'Category'

  # has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  # belongs_to :parent_category, :class_name => "Category"

  has_many :child_categories, class_name: "Category",
           foreign_key: "parent_id"

  belongs_to :parent, class_name: "Category"

  translates :name, :category_url
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :category_id

    attr_accessible  :name, :category_url

    rails_admin do
      visible false
      nested do
        field :locale , :hidden
        field :name do
          label 'Назва'
          help 'Введіть унікальнуб не повторювану назву'
        end
        # field :category_url do
        #   label 'Назва на різних мовах'
        #   help ''
        # end
      end


    end
  end

  has_many :products, inverse_of: :category

  has_attached_file :icon,
                    url:'/assets/images/:class/ico/:id/image_:style.:extension',
                    path:':rails_root/public:url'

  has_attached_file :image,
                    styles: { large: "600x600>" },
                    convert_options: { large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/:id/image_:style.:extension",
                    path:':rails_root/public:url'


  validates :name, :uniqueness => true, presence: true
  before_validation :generate_category_url
  def generate_category_url
    self.category_url ||= name.parameterize
  end

  rails_admin do
    navigation_label 'Каталог'
    label 'Скатертина'
    label_plural 'Скатертини'
    weight 1

    list do
      field :name
      field :parent
      field :icon
      field :image
      field :category_url
    end

    edit do
      field :name
      field :parent do
        label 'Категорія'
        help ''
      end

      field :image, :paperclip do
        label 'Зображення'
        help 'Зображення для альбому повинне бути 600. / 600px.'
      end
      field :icon, :paperclip do
        label 'Іконка'
        help ''
      end
    end

  end
end
