class PurchasesController < ApplicationController
  before_action :grab_purchase, only: [:show, :edit, :update, :destroy]

  def index
    @purchases = Purchase.all
  end

  def show
  end

  def new
    @purchase = Purchase.new
  end

  def edit
     
  end

  def create
    @purchase = Purchase.create(purchase_params)
    redirect_to purchase_path(@purchase)
  end

  def update
    @purchase.update(purchase_params)
    redirect_to purchases_path
  end

  def destroy
    @purchase.delete
    redirect_to purchases_path
  end

  private

    def grab_purchase
      @purchase = Purchase.find(params[:id])
    end
    
    def purchase_params
      params.require(:purchase).permit(:customer_name, :price, :brew_id)
    end

end
