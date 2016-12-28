class User < ActiveRecord::Base
  has_many :items

  # Callbacks are methods that get called at certain moments of an object's life cycle
  # They should be used only to modify the internal state of the object
  # before_create :set_token
  before_create :set_name


  def admin?
    false
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
