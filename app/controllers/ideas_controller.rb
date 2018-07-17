class IdeasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def new
    @idea = Idea.new 
  end

  def create
    # render json: params
    @idea = Idea.new idea_params 
    @idea.user = current_user

    if @idea.save
      redirect_to idea_path(@idea.id)
    else
        #render json: idea.errors
      render :new
    end
  end

  def show
    @idea = Idea.find params[:id]
    # render json: @ideas

    @idea.save

    @review = Review.new
    @reviews = @idea.reviews.order(created_at: :desc)
   
  #   # render :show
      #render json:params
  end

  def index
    # @idea = Idea.find params[:id] 
    @ideas = Idea.order(created_at: :desc)
  #   # render json: @ideas
  end

  def edit
    @idea = Idea.find params[:id] 
  end

  def update
    @idea = Idea.find params[:id] 
    if @idea.update(idea_params)
      redirect_to idea_path(@idea.id)
    else
      # render json:params
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end

  private
  def find_idea
    @idea = Idea.find params[:id]
  end

  def idea_params
    params.require(:idea).permit(:title, :description)
  end

  def authorize_user!
    unless can?(:crud, @idea)
      flash[:danger] = "Access Denied"
      redirect_to idea_path(@idea)
    end
  end
end