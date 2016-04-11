class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def index
    # @articles = Article.all
    # @articles = Article.order(created_at: :desc) # descending order
    @articles = Article.order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first # to grab a USER to the create action to temporarily hardcode a user to articles
    if @article.save
      flash[:success] = "Article was succesfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article was succesfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article.destroy
      flash[:danger] = "Article was succesfully deleted"
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end
    def require_same_user
      if current_user != @article.user
        flash[:danger] = "You can only edit or delete your own articles"
        redirect_to root_path
      end
    end

end