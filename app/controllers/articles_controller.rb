# Class for article

class ArticlesController < ApplicationController
	def new
	end 
	def index 
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id]) 
	end

	def create
		@article = Article.new(article_params)
	 
		if @article.save
			redirect_to @article, success: "Book created!"
		else 
			render new_article_path
		end
	end 
	
	private 
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
