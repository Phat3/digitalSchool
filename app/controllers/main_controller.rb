class MainController < ApplicationController

    layout 'application'

  def index
    render '/home'
  end

  def prova
    render '/prova'
  end

end
