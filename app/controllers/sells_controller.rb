class SellsController < ApplicationController
  before_action :set_sell, only: [:show, :edit, :update, :destroy]
  layout "sell"

  # GET /sells
  # GET /sells.json
  def index
    @sells = Sell.all
  end

  # GET /sells/1
  # GET /sells/1.json
  def show
  end

  # GET /sells/new
  def new
    @sell = Sell.new
    #byebug
    #@sell.products.new
    1.times {@sell.products.build}

  end

  # GET /sells/1/edit
  def edit
  end

  # POST /sells
  # POST /sells.json
  def create
    @sell = Sell.new(sell_params)
    #byebug

    respond_to do |format|
      temp = Product.find(sell_params[:products_attributes][:"0"][:name])
      #byebug
      #@sell.products.each do |product|
        #Product.find_by(name: product.name)
        #byebug()
      #end
      #byebug
      @sell.products.destroy_all
      #byebug
      @sell.products << temp
      Sell.last.update!(total: 0.0)
      Sell.last.orders.first.update_attributes(quantity: 1)
      Sell.last.update!(total: Sell.last.total + (Sell.last.products.first.price * Sell.last.orders.first.quantity))
      #byebug
      if @sell.save
        format.html { redirect_to sells_path, notice: 'Sell was successfully created.' }
        format.json { render :show, status: :created, location: @sell }
      else
        format.html { render :new }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sells/1
  # PATCH/PUT /sells/1.json
  def update
    respond_to do |format|
      if @sell.update(sell_params)
        format.html { redirect_to sells_path, notice: 'Sell was successfully updated.' }
        format.json { render :show, status: :ok, location: @sell }
      else
        format.html { render :edit }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sells/1
  # DELETE /sells/1.json
  def destroy
    @sell.destroy
    respond_to do |format|
      format.html { redirect_to sells_url, notice: 'Sell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell
      @sell = Sell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sell_params
      params.require(:sell).permit(:sell_date, :total,  products_attributes: [:name, :id])
      #params.require(:sell).permit(:sell_date, :total, products_attributes: [:name, :price, :description])
    end
    
    #sell_params[:products_attributes][:"0"][:name]

end
