class TranscriptsController < ApplicationController

 def show
    @transcript = Transcript.find(params[:id])
  end

  def new
    authorize! :index, :transcript, :message => 'Access limited to administrators only.'
  	@transcript = Transcript.new(key: params[:key])
  end

  def addtranscript
    authorize! :view, :transcript, :message => 'Access limited to administrators only.'
    @transcriptuploader = Transcript.new.transcript
    @transcriptuploader.success_action_redirect = new_transcript_url
  end

  def edit
    authorize! :index, :transcript, :message => 'Access limited to administrators only.'
    @transcript = Transcript.find(params[:id])
  end

  def update
    authorize! :index, :transcript, :message => 'Access limited to administrators only.'
    @transcript = Transcript.find(params[:id])
    if @transcript.update_attributes(params[:transcript])
      flash[:success] = "Transcript updated"
      redirect_to transcripts_path
    else
      render 'edit'
    end
  end

  def create
    authorize! :index, :transcript, :message => 'Access limited to administrators only.'
    @transcript = Transcript.new(params[:transcript])
    if @transcript.save
      redirect_to root_path
    else
      render 'new'
    end    
  end

  def index
    authorize! :index, :transcript, :message => 'Access limited to administrators only.'
  	@transcripts = Transcript.all
  end

  def destroy
    authorize! :index, :transcript, :message => 'Access limited to administrators only.'
    @transcript = Transcript.find(params[:id])
    @transcript.destroy
    redirect_to transcripts_path, :notice => "Transcript deleted!"
  end

end
