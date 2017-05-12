# frozen_string_literal: true
class HomeController < ApplicationController

  def index
    render :index, layout: 'logged' if current_user.logged?
  end
end
