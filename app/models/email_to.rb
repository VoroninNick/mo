class EmailTo < ActiveRecord::Base
  attr_accessible :customized_form, :order_product_from, :feedback_form, :call_order_form

  validates_presence_of :customized_form, :message => "Заповніть це поле! Поле не може бути пустим."
  validates_presence_of :order_product_from, :message => "Заповніть це поле! Поле не може бути пустим."
  validates_presence_of :feedback_form, :message => "Заповніть це поле! Поле не може бути пустим."
  validates_presence_of :call_order_form, :message => "Заповніть це поле! Поле не може бути пустим."

  rails_admin do
    navigation_label 'Електронна скринька'
    label 'Електронна скринька'
    label_plural 'Електронна скринька'

    list do
      field :customized_form
      field :order_product_from
      field :feedback_form
      field :call_order_form
    end

    edit do
      field :customized_form do
        label "ФОРМА ІНДИВІДУАЛЬНОГО ЗАМОВЛЕННЯ"
        help ''
      end
      field :order_product_from do
        label "ФОРМА ОФОРМЛЕННЯ ЗАМОВЛЕННЯ"
        help ''
      end
      field :feedback_form do
        label "ФОРМА ЗВОРОТНЬОГО ЗВ’ЯЗКУ"
        help ''
      end
      field :call_order_form do
        label "ФОРМА ЗАМОВЛЕННЯ ДЗВІНКА"
        help ''
      end
    end
  end
end
