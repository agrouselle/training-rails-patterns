class User < ActiveRecord::Base
  has_many :items
  has_many :reviews

  # Callbacks are methods that get called at certain moments of an object's life cycle
  # They should be used only to modify the internal state of the object
  # before_create :set_token
  before_create :set_name

  def admin?
    false
  end

  def suspend!
    # Transctions encure that all enclosing operations are atomic
    # If any operation fails, the database will rollback to its initial state

    # Bad example
    # There is too much logic cluttered into a single method
    # Also, this class has too many responsibilities, which breaks the Single Responsibility Principle
    # An object that controls too many other objects in the system is an anti-pattern
    # knows as God Object
    self.class.transaction do
      self.update!(is_approved: false)
      self.items.each {|item| item.update!(is_approved: false) }
      self.reviews.each {|review| review.update!(is_approved: false) }
    end
  end

  # It's a convention to set callback methods as protected
  protected

  # Bad example
  # Referencing other models in callbacks:
  #  - introduces tight coupling
  #  - affects the object's database life cycle
  #
  # def set_token
  #   self.token = TokenGenerator.create(self)
  # end

  # Better example
  # The token generation is now decoupled from the object's database life cycle
  def register
    self.token = TokenGenerator.create(self)
    save
  end

  # Better example
  # This methods has no external dependency. It's all within the User model
  def set_name
    self.name = self.login.capitalize if name.blank?
  end
end
