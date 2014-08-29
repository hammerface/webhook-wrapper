require 'util_functions'

class StaticPagesController < ApplicationController
  before_filter :signed_in_user, only: [:webhooks, :history]

  def home
  end

  def webhooks
    #@change = Utils::get_webhook_urls('webhook-change-commit')
    @change = Url.where(trig_type: "change").to_a
    @shelve = Url.where(trig_type: "shelve").to_a
    @form   = Url.where(trig_type: "form").to_a
  end

  def history
  end
end
