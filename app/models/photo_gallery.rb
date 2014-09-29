class PhotoGallery < ActiveRecord::Base
  attr_accessible :imageable_id, :imageable_type, :image, :title, :alt

  belongs_to :imageable, polymorphic: true

  translates :title, :alt
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :photo_gallery_id

    attr_accessible :title, :alt

    rails_admin do
      visible false
      nested do
        field :locale , :hidden
        field :title do
          label 'Назва'
          help ''
        end
        field :alt do
          label 'Альтернативний текст'
          help ''
        end
      end
    end
  end

  has_attached_file :image,
                    styles: { thumb: "500x500#", large: "1920x1200>"},
                    convert_options: { thumb: "-quality 94 -interlace Plane",
                                       large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/:id/image_:style.:extension",
                    path:':rails_root/public:url'


  validates_presence_of :image, :message => "Виберіть фотографію, відповідно до зазначених розмірів! Поле не може бути пустим."

  rails_admin do
    label 'Фотогалерея'
    label_plural 'Фотогалереї'
    visible false
    edit do

      field :image, :paperclip do
        label 'Зображення'
        help 'Зображення для альбому повинне бути 1920. / 1200.'
      end

      field :translations, :globalize_tabs do
        label 'Локалізації'
      end
    end
  end
end
