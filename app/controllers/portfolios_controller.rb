class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout "portfolio"
  
  def index
    @portfolio_items = Portfolio.all
  end
  
  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build}
  end
  
  def create
     @portfolio_item = Portfolio.new(portfolio_param)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your Portfolio item is now live' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    3.times { @portfolio_item.technologies.build}
  end

  def update

    respond_to do |format|
      if @portfolio_item.update(portfolio_param)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
  end
  
  def destroy
    #Destroy/ delete the record
    @portfolio_item.destroy
    
    #Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was successfully destroyed.' }
    end
  end
  
  private
  
  def portfolio_param
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name])
  end
  
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
  
end
