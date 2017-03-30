class PortfoliosController < ApplicationController
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
    @portfolio_item = Portfolio.find(params[:id])
    3.times { @portfolio_item.technologies.build}
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_param)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def destroy
    #Perfom de lookup
    @portfolio_item = Portfolio.find(params[:id])
    
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
  
end
