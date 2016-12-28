# Plain Old Ruby Object
# This class is responsible for only one thing

# This is an abstraction of the user suspension concept. Examples of abstraction (non-AR) include:
# - UserRegistration
# - PlanSubscription
# - CreditCardCharge
# - ShoppingCart

class UserSuspension
  def initialize(user)
    @user = user
  end

  def create!
    @user.class.transaction do
      disapprove_user!
      disapprove_items!
      disapprove_reviews!
    end
  end

  private

  def disapprove_user!; end
  def disapprove_items!; end
  def disapprove_reviews!; end
end