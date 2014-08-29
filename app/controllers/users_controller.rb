class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    p4       = '/usr/local/bin/p4'
    server   = '10.0.102.53:1209'
    user     = params[:user][:name]
    password = params[:user][:password]

    output = `/bin/echo #{password} | #{p4} -p #{server} -u #{user} login -p`
    #puts output
    regex = /\AEnter password: .?[A-Z0-9]+.?\z/m
    if output =~ regex
      @user = User.new(name: user)
      if @user.save
        sign_in @user
        redirect_to webhooks_path
      else
        @user = User.new
        render :new
      end
    else
      @user = User.new
      render :new
    end
  end

  def destroy
    @user = current_user
    puts 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
    puts @user
    puts 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
    sign_out
    @user.delete
    redirect_to signin_url
  end

end
