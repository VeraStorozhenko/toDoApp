class ElementsController < ApplicationController
  def index
    @elements = Element.all
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
    #@element = Element.find(params[:id])
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

  def destroy
    @element = Element.find(params[:id])
    @element.destroy
    redirect_to elements_path
  end	

  private
    def element_param
      params.require(:element).permit(:text)
    end	
end
