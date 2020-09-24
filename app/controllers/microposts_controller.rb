class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :set_micropost, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    # @micropost.image.attach(params[:micropost][:image]) - the build know's already. just add in permitted

    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    if request.referrer.nil? || request.referrer == microposts_url
      redirect_to root_url
    else
      redirect_to request.referrer
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :image)
  end

  def set_micropost
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
