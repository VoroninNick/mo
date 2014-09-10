class MainController < ApplicationController
  def index
    # @publication = Publication.order("created_at ASC").limit(6)
    @publication = Publication.where(selected_article: true).order("created_at DESC")
  end


  def contacts

  end

  def testing

  end
end
