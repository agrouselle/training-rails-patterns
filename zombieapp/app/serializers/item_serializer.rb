class ItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :published, :published_on, :url

  def url
    item_path(object)
  end
end
