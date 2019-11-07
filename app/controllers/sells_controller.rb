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
    #3.times {@sell.products.build}

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
      #Almacenar en un array 'temp' los productos seleccionados en los select_collection
      temp = []
      cont = 0
      #Recorro el array 'sell_params' para tomar el id de los productos
      sell_params[:products_attributes].each do |venta|
        #Se convierte a un hash el sell_params[:products_attributes]
        value = sell_params[:products_attributes].to_h
        #se toma la key del hash
        value = value.keys
        #se toma el valor que tiene la key del hash
        value = value[cont]
        #byebug
        temp[cont] = Product.find(sell_params[:products_attributes][:"#{value}"][:name])
        cont+=1
        #byebug
      end

      #byebug
      #temp = Product.find(sell_params[:products_attributes][:"0"][:name])
      #byebug
      #@sell.products.each do |product|
        #Product.find_by(name: product.name)
        #byebug()
      #end
      #Se borra la venta para solo tomar los productos seleccionados
      @sell.products.destroy_all
      #Se ingresa a la venta sólo los productos seleccionados
      @sell.products << temp
      
      if @sell.save
        pos = 0
        @sell.update!(total: 0.0)
        #Recorro el array temp, acá podría recorrer el array 'sell_params'
        temp.each do |ciclo|
          #El ciclo permite actualizar la cantidad de producto comprado y
          #actualizar el total de la venta
          @sell.orders[pos].update_attributes(quantity: 1)
          @sell.update!(total: @sell.total + (@sell.products[pos].price * @sell.orders[pos].quantity))
          pos+=1
        end
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
      params.require(:sell).permit(:sell_date, :total, :table, products_attributes: [:name, :id, :_destroy])
      #params.require(:sell).permit(:sell_date, :total, products_attributes: [:name, :price, :description])
    end
    
    #sell_params[:products_attributes][:"0"][:name]

end
