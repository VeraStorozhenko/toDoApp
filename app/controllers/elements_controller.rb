class ElementsController < ApplicationController
	helper_method :sort_column, :sort_direction
  skip_before_action :verify_authenticity_token
  respond_to :html, :js

  def index
    @element = Element.new
    @elements = Element.all.order("#{sort_column} #{sort_direction}")
  end
    
  def show
  	@element = Element.find(params[:id])
  end

  #Отображение формы редактирования существующего элемента
  def edit
    @element = Element.find(params[:id])
  end

  #Создание нового элемента
  def create
    @element = Element.new(element_param) #Инициализация модели Element

    if @element.save
      flash.now.notice = 'Сохранено успешно'
      redirect_to action: "index"     
    else
      flash.now[:alert] = 'Неверный ввод'
    end
  end
 
  #Редактирование элементов
	def update 
    @element = Element.find(params[:id])

    if @element.update(element_param)
      redirect_to action: "index"
    else
      render 'edit'
    end  
	end	

  def destroy
    @element = Element.find(params[:id])
    @element.destroy
    flash.now.notice  = "Successfully destroyed."
    redirect_to elements_path
  end
  
  def check
    @element = Element.find(params[:id])

    if @element != nil?
      @element.update(:important => params[:bool])
      flash[:notice] = "Saved" #todo without reload
    else
      flash[:alert] = "Error"
    end 
  end	

  private
    def element_param
      params.require(:element).permit(:text, :important)
    end

	  def sort_column
    	Element.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  	end

  	def sort_direction
    	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end

    def all_tasks
      @tasks = Element.all
    end

    def set_tasks
      @task = Element.find(params[:id])
    end    	
end






