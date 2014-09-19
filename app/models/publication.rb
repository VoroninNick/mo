class Publication < ActiveRecord::Base
  attr_accessible :title, :author, :short_description, :description, :image, :selected_article, :url

  translates :title, :author, :short_description, :description, :fallbacks_for_empty_translations => true
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :publication_id

    attr_accessible  :title, :author, :short_description, :description

    rails_admin do
      visible false
      nested do
        field :locale , :hidden
        field :title do
          label 'Заголовок'
          help ''
        end
        field :author do
          label 'Автор'
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

  validates_presence_of :title, :message => "Заповніть це поле! Поле не може бути пустим."
  validates_presence_of :image, :message => "Виберіть фотографію, відповідно до зазначених розмірів! Поле не може бути пустим."
  validates_presence_of :short_description, :message => "Заповніть це поле! Поле не може бути пустим."
  validates_presence_of :description, :message => "Заповніть це поле! Поле не може бути пустим."

  has_attached_file :image,
                    styles: { thumb: "400x400#", large: "576x400>" },
                    convert_options: { large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/:id/image_:style.:extension",
                    path:':rails_root/public:url'

  before_validation :generate_url
  def generate_url
    self.url = title.parameterize
  end

  rails_admin do
    navigation_label 'Публікації'
    label 'Публікація'
    label_plural 'Публікації'

    list do
      field :image do
        label 'Зображення'
      end
      field :url do
        label 'Лінк'
      end
      field :selected_article do
        label 'Публікувати'
      end
    end

    edit do
      field :selected_article do
        label 'Публікувати'
      end
      field :image, :paperclip do
        label 'Зображення'
        help 'Зображення для альбому повинне бути 600. / 440px.'
      end


      field :translations, :globalize_tabs do
        label 'Локалізації'
      end
    end
  end
end
