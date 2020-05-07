class ElementsController < ApplicationController

  helper_method :sort_column, :sort_direction #что значит :?
  
  #protected  
  def sort_column
    Element.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    #created_at
    #text
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def index
    @elements = Element.all
    @element = Element.new

    @elements = Element.order(sort_column + " " + sort_direction)
  end	

  def show
  	@element = Element.find(params[:id])
  end

  def new
    #@element = Element.new	
    @element = Element.new(element_param) #Инициализация модели Element
    #Имя класса - Element соответсвует в models/element.rb      
    if @element.save #Сохраняем в базе данных, метод возвращает true/false
      redirect_to @element #если валидация успешна, то переходим к action show 
    else
      render 'new' #если валидация неуспешна, то перезагружаем страницу
    end   
  end

  def edit
    @element = Element.find(params[:id])
  end

#Element - name like in Model
  def create
    @element = Element.new(element_param) #Инициализация модели Element
    #Имя класса - Element соответсвует в models/element.rb      
    if @element.save #Сохраняем в базе данных, метод возвращает true/false
      redirect_to @element #если валидация успешна, то переходим к action show 
    else
      render 'new' #если валидация неуспешна, то перезагружаем страницу
    end  
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

  private
    def element_param
      params.require(:element).permit(:text)
    end	
end






