class UrlsController < ApplicationController
  def create
    @urls = Url.new(params[:url][:trig_type])
    button = params[:url][:button_type]
    address = params[:url][:address]

    if ('add' == button && !(address.empty?))
      @urls << (address)
    elsif ('delete' == button)
      @urls.delete(address)
    end
    
    Utils::send_webhook_urls(params[:url][:trig_type], @urls.uniq)
    redirect_to webhooks_url    
  end


  private
     def url_params
       params.require(:url).permit(:urls, :address)
     end
 end
