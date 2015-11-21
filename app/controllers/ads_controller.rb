class AdsController < ApplicationController

  def index
    @ads = Ad.all
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def create
    @ad = Ad.new(ad_params)

    if  @ad.save
      redirect_to ads_path
    else
      render 'new'
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

  def image
    content = @ad.image.read
    if stale?(etag: content, last_modified: @ad.updated_at.utc, public: true)
      send_data content, type: @ad.image.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

  private
    def ad_params
      params.require(:ad).permit(:title, :text, :image, :image_cache)
    end
end
