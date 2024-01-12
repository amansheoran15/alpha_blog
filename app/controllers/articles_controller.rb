# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  def show

  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article has been saved!"
      redirect_to article_path(@article), notice: "Article has been saved!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title,:description)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end

