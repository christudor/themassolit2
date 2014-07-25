class StaticPagesController < ApplicationController
  def home
    @message = Message.new
  end

  def about
  end

  def contact
  end

  def samples
  end

  def testimonials
  end

  def privacypolicy
  end

  def terms
  end

  def pricing
    @message = Message.new
  end

  def blog
  end

end
