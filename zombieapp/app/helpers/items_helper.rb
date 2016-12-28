module ItemsHelper
  # Helpers are a good starting point
  # However they:
  #  - pollute the global namespace with methods specific to a model
  #  - forces a functional approach in a object-oriented application

  # Bad example
  # It's better to have it in a Decorator
  # def publication_date(item)
  #   item.published_on.strftime('%Y-%m-%d')
  # end

  # Bad example
  # View-specific logic should go into a Decorator
  # Doesn't scale well as the view-logic grows
  # def items_classes(item)
  #   classes = ['item']
  #   classes << 'front-page' if item.front_page?
  #   classes
  # end

end
