class Promotion < ActiveRecord::Base
  attr_accessible :title, :image, :t_title, :selected_promotion

  translates :title, :fallbacks_for_empty_translations => true
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :promotion_id

    attr_accessible  :title

    rails_admin do
      visible false
      nested do
        field :locale , :hidden
        field :title do
          label 'Заголовок'
          help ''
        end
      end


    end
  end

  validates_presence_of :title, :message => "Заповніть це поле! Поле не може бути пустим."
  validates_presence_of :image, :message => "Виберіть фотографію, відповідно до зазначених розмірів! Поле не може бути пустим."

  has_attached_file :image,
                    styles: {large: "1920x400>" },
                    convert_options: { large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/:id/image_:style.:extension",
                    path:':rails_root/public:url'

  before_validation :generate_t_title
  def generate_t_title
    self.t_title = title.parameterize
  end

  has_many :products, inverse_of: :promotion
  attr_accessible :products, :product_ids

  rails_admin do
    navigation_label 'Каталог'
    label 'Акція'
    label_plural 'Акції'
    weight 5

    list do
      field :image do
        label 'Зображення'
      end
      field :t_title do
        label 'Транслітерація'
      end
      field :selected_promotion do
        label 'Діюча'
      end
    end

    edit do
      field :selected_promotion do
        label 'Діюча?'
      end
      field :image, :paperclip do
        label 'Зображення'
        help 'Зображення для альбому повинне бути 1920. / 400px.'
      end


      field :translations, :globalize_tabs do
        label 'Локалізації'
      end
      field :products do

      end

    end
  end
end
