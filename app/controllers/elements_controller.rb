class ElementsController < ApplicationController
	helper_method :sort_column, :sort_direction
  skip_before_action :verify_authenticity_token
  before_action :all_tasks, only: [:index, :create]
  respond_to :html, :js

  def index
    @element = Element.new
    @elements = Element.all.order("#{sort_column} #{sort_direction}")

    #flash.notice = 'Мне не спится, нет огня;'
    #flash[:alert] = 'Всюду мрак и сон докучный.'
  end
    
  def show
  	@element = Element.find(params[:id])
  end

  #отображение формы редактирования существующего
  def edit
    @element = Element.find(params[:id])
  end

  #Сохранение
	#Element - name like in Model
  def create
    @element = Element.new(element_param) #Инициализация модели Element

    if @element.save
      redirect_to @element
      #flash.now.notice = 'Сохранено успешно'
      #flash.now[:notice] = 'Успешно'
      #redirect_to elements_path
    else
      render 'new'
     #flash.now[:alert] = 'Неверный ввод'
    end

    #redirect_to elements_path  

    #redirect_to root_path, :notice => 'Что тревожишь ты меня?'
    #Имя класса - Element соответсвует в models/element.rb      
    #if @element.save #Сохраняем в базе данных, метод возвращает true/false
    #  redirect_to @element #если валидация успешна, то переходим к action show 
    #else
    #  render 'new' #если валидация неуспешна, то перезагружаем страницу
    #end  
  end
 
	def update #Редактирование элементов
    @element = Element.find(params[:id])

    if @element.update(element_param)
      redirect_to @element
    else
      render 'edit'
    end  
	end	

  def destroy
    @element = Element.find(params[:id])
    @element.destroy
    flash[:notice] = "Successfully destroyed."
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






