require 'util_functions'

class StaticPagesController < ApplicationController
  before_filter :signed_in_user, only: [:webhooks, :history]

  def home
  end

  def webhooks
    @change = Utils::get_webhook_urls('webhook-change-commit')
    @shelve = Utils::get_webhook_urls('webhook-shelve-commit')
    @form   = Utils::get_webhook_urls('webhook-form-commit')
  end

  def history
  end
end
