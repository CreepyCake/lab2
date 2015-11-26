class AdsController < ApplicationController


  #all the actions for controller that will perform CRUD operations for ads

  #only public methods can be actions and they must be placed before any of private methods
  #and the usual order is: index, show, new, edit, create, update, destroy

  def index #render index page
    @search = Ad.solr_search do #searching for matches in database using sunspot
      fulltext params[:search]
    end
    @ads = @search.results #return results of search
  end

  def show
    @ad = Ad.find(params[:id]) #to show certain ad, we need to find it in database by id
  end

  def new #this action renders a form called 'new' on ads/new route
    @ad = Ad.new
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def create #this action is called when 'submit' button is pressed
    @ad = Ad.new(ad_params) #create a new document in Mongo using data from form

    if  @ad.save #if successfully saved
      redirect_to ads_path #redirect to index page with all the ads
    else #otherwise
      render 'new' #render same form for creating a new ad, but this time all error messages will be shown
    end
  end

  def update
    @ad = Ad.find(params[:id])

    if @ad.update_attributes(ad_params)
      redirect_to ads_path
    else
      render 'edit'
    end
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    redirect_to ads_path
  end

  private
  #method for permitting parameters to be used in controller actions
  #it is for preventing mass assignment
    def ad_params
      params.require(:ad).permit(:title, :description, :metro_station, :rooms, :image)
    end
end
