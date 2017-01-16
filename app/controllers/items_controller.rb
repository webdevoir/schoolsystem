class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy], except: [:get_item]

  before_action :check_rights
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
    @shopcategories = Shopcategory.all
    @grades= Grade.where(section: nil)

  end

  # GET /items/1/edit
  def edit
    @shopcategories = Shopcategory.all
    @grades= Grade.all

  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.sold = 0
    @item.left = 0
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

  def add_stock
  end

  def adding_stock
    item = Item.find_by_code(params[:code])
    item.left = item.left + params[:qty].to_i
    item.save!
    redirect_to items_path
  end

  def get_item
    @details = Item.find_by_code(params[:item_id])
    if @details.blank?
      @details = false
    end
    respond_to do |format|
      format.json {render json: [details: @details]}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:code, :name, :shopcategory_id, :size, :price, :grade_id, :sold, :left, :purchase)
    end

    def check_rights
      unless current_user.role.rights.where("value = 'create_bookshop'").any?
        redirect_to root_path, alert: "You are not authorized...!!!"
      end
    end
end
