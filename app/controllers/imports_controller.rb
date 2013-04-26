class ImportsController < ApplicationController

require 'plist'

  def index

  	#Take the Library XML file and pull out some attributes.

	xml = Plist::parse_xml('iTunes Library.xml')
	@tracks = xml["Tracks"]
  end
end