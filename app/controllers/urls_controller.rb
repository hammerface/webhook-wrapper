class UrlsController < ApplicationController
  def create
    puts 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
    puts params
    puts 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'

    @url = Url.new(url_params)
    if @url.save
      #flash[:success] = "URL added."
      redirect_to webhooks_url
    else
      #flash[:error] = "Add failed."
      redirect_to webhooks_url
    end      
  end  


  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to webhooks_url
  end

  private
     def url_params
       params.require(:url).permit(:trig_type, :address)
     end
 end
