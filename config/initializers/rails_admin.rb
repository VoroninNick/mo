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
  config.included_models = [ User]

  [Publication, Product, PhotoGallery, Category, Promotion, DsCategory, DCategory, DrinkSet, Decor, ProductProperty, ProductPack, PashaFolder].each do |model|
    config.included_models += [model, model::Translation]
  end

  [PashaFile].each do |model|
    config.included_models += [model]
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
