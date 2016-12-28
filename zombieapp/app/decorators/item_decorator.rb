class ItemDecorator
  attr_reader :item

  def initialize(item)
    @item = item
  end

  # Better example
  # Extract presentation logic out of the Item model and to a decorator
  def front_page?
    item.published_on > 2.days.ago
  end

  # Better example
  # Extract presentation logic out of the Item helper and to a decorator
  def publication_date
    item.published_on.strftime('%Y-%m-%d')
  end

  # Better example
  #
  def classes
    classes = ['item']
    classes << 'front-page' if front_page?
    classes
  end

  # Forward any undefined method to the wrapped object
  def method_missing(method_name, *args, &block)
    item.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private=false)
    item.respond_to?(method_name, include_private) || super
  end
end