class ContentController < ApplicationController
  before_filter :authenticate_person!

  # Silver pags are for people who have signed up, but who have not been validated yet. May not use this...

  def silver
    authorize! :view, :silver, :message => 'Access limited to Silver Plan subscribers.'
  end

  # Gold pages include the course content and related materials. Access is limited to students and teachers.

  def gold
    authorize! :view, :gold, :message => 'Access limited to subscribers.'
  end

  # Platinum pages include the student analytics, accessible only to teachers.

  def platinum
    authorize! :view, :platinum, :message => 'Access limited to teachers only.'
  end
end