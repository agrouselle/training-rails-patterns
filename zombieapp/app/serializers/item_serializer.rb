class ItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :published, :published_on, :url

  # Each element of the association will also be serialized
  # When a custom serializer isn't found, the default Rails serialization is used
  has_many :comments
  belongs_to :user

  # Returns only ids for associations
  # embed :ids, include: true

  def url
    item_path(object)
  end

  # Overrides the association method to only return the record that we want
  def comments
    object.comments.approved
  end

  # Overrides the attributes method in order to have total control over which attributes are returned
  def attributes(*args)
    data = super(*args)

    if current_user.try(:admin?)
      data[:superpowers] = true
    end

    data
  end
end
