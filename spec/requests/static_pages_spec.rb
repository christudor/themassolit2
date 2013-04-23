require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'Massolit'" do
      	visit '/static_pages/home'
      	page.should have_selector('h1', :text => 'Welcome to the MASSOLIT')
    end

    it "should have the title 'Home'" do
    	visit '/static_pages/home'
    	page.should have_selector('title', :text => "MASSOLIT | Home")
    end
  end

  describe "Help page" do

  	it "should have the h1 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('h1', :text => 'Help')
  	end

  	it "should have title 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('title', :text => "MASSOLIT | Help")
  	end
  end


  describe "About page" do

  	it "should have the h1 'About the MASSOLIT'" do
  		visit '/static_pages/about'
  		page.should have_selector('h1', :text => 'About')
  	end

  	it "should have the title 'About'" do
  		visit '/static_pages/about'
  		page.should have_selector('title', :text => "MASSOLIT | About")
  	end
  end
end