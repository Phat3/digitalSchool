class MainController < ApplicationController

    layout 'application'

  def index
    render '/home'
  end

  def history
    render '/history'
  end

  def principles
    render '/principles'
  end
end
