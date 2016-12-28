class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :publish]

  # Bad Example
  #  - multiple calls to the same object indicate a code smell
  #  - tell, don't ask: we should tell objects what to do, and not ask them questions
  #    about their internal state
  #  - controllers are responsible for orchestring models
  #
  # def publish
  #   if @item.is_approved? || @item.user.admin?
  #     @item.published_on = Time.now
  #
  #     if @item.save
  #       flash[:notice] = 'Your item is published!'
  #     else
  #       flash[:notice] = 'There was an error'
  #     end
  #   else
  #     flash[:notice] = 'Unable to publish this item'
  #   end
  #
  #   redirect_to @item
  # end

  # Better example
  def publish
    if @item.publish
      flash[:notice] = 'Your item is published!'
    else
      flash[:notice] = 'There was an error'
    end

    redirect_to @item
  end

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.fetch(:item, {})
    end
end
