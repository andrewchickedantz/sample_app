class PagesController < ApplicationController
  def home
  @title = "Home"
  end

  def contact
  @title = "Contact"
  end

  def about
  @title = "About"
  end

	def help
	@title = "Help"
	end

	#def each
	#@base_title = "Ruby on Rails Tutorial Sample App"
	#end

end
