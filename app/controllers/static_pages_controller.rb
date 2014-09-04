require 'util_functions'

class StaticPagesController < ApplicationController
  before_filter :signed_in_user, only: [:webhooks]

  def home
  end

  def webhooks
    #@change = Utils::get_webhook_urls('webhook-change-commit')
    puts 'TTESTSTSTSTSTST'
    @change = Url.new('webhook-change-commit')
    puts 'ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ'
    puts @change
    puts 'ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ'
    @shelve = Url.new('webhook-shelve-commit')
    @form   = Url.new('webhook-form-commit')
  end
end
