class DCategory < ActiveRecord::Base
  attr_accessible :name, :icon, :parent_id, :t_name, :child_category_id

  has_many :child_categories, class_name: "DCategory",
           foreign_key: "parent_id"

  belongs_to :parent, class_name: "DCategory"

  translates :name, :t_name
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :d_category_id

    attr_accessible  :name, :t_name

    rails_admin do
      visible false
      nested do
        field :locale , :hidden
        field :name do
          label 'Назва'
          help 'Введіть унікальну не повторювану назву'
        end
        # field :t_name do
        #   label 'Назва на різних мовах'
        #   help ''
        # end
      end


    end
  end

  has_many :decors, inverse_of: :d_category

  has_attached_file :icon,
                    url:'/assets/images/:class/ico/:id/image_:style.:extension',
                    path:':rails_root/public:url'

  # has_attached_file :image,
  #                   styles: { large: "600x600>" },
  #                   convert_options: { large: "-quality 94 -interlace Plane" },
  #                   url: "/assets/images/:class/:id/image_:style.:extension",
  #                   path:':rails_root/public:url'

  validates :name, :uniqueness => true, presence: true
  before_validation :generate_t_name
  def generate_t_name
    self.t_name ||= name.parameterize
  end

  rails_admin do
    navigation_label 'Каталог'
    label 'Декор'
    label_plural 'Декори'
    weight 3

    list do
      field :name
      field :parent
      field :icon
      field :t_name
    end

    edit do
      field :translations, :globalize_tabs do
        label 'Локалізації'
      end
      field :parent do
        label 'Категорія'
        help ''
      end
      field :icon, :paperclip do
        label 'Іконка'
        help ''
      end
    end

  end
end
