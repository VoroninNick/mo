require 'i18n'
I18n.default_locale = :en


RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show
  end
  included_models = [ User, Cart, LineItem, Publication, Product, PhotoGallery, Category, Promotion, DsCategory, DCategory, DrinkSet, Decor, ProductProperty, ProductPack, PashaFolder]

  included_models.each do |model|


    model_class = model
    if model_class.is_a?(String)# && Object.const_defined?(model_class)
      model_class = Object.const_get(model_class)
    end

    if ActiveRecord::Base.connection.tables.include?(model_class.table_name)

      config.included_models += [model_class]
      if model_class.respond_to?(:translates) && model_class.translates? && ActiveRecord::Base.connection.tables.include?(model_class.translation_class.table_name)
        config.included_models += [model_class.translation_class]
      end
    end
  end


  # config.model Category do
  #   treeview true
  # end
  config.navigation_static_links = {
      'Translate' => 'https://translate.google.com.ua',
      'Приклад' => 'https://github.com/sferik/rails_admin/issues/997'
  }
  # config.model 'DsCategory::DrinkSet' do
  #
  # end

end
