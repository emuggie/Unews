class MainController < ApplicationController
  include ApplicationHelper
  def main
    @articles = Article.all
  	respond_to do |format|
  	  format.html
  	end	
  end
end
