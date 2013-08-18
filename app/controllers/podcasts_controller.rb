class PodcastsController < ApplicationController

require 'plist'

	def show
	end

	def index
		xml = Plist::parse_xml('C:\Users\Chris\Music\Library\iTunes Library.xml')
		@tracks = xml["Tracks"]
	end

	def import
		Podcast.import(params[:file])
		redirect_to root_url, notice: "Podcasts imported"
	end

end
