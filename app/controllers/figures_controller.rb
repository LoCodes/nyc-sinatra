class FiguresController < ApplicationController
  # add controller methods

  #allows you to view "first page"
  get '/figures' do 
    @figures = Figure.all   #needed for interpolation in view  
    erb :'figures/index'    #iterpolated firgures because we rendered it in the view 
  end 


  # allows you to view form to create a new figure
  get '/figures/new' do 
    erb :'figures/new'     # render new form 
  end 


  # allows you to create a new figure with a title
  # allows you to create a new figure with a landmark
  # allows you to create a new figure with a new title
  # allows you to create a new figure with a new landmark
  # creates checkboxes for all the landmarks and titles created on the Figures new page
  # allows you to list all figures


  post '/figures' do
    @figure = Figure.create(params['figure'])   
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  #allows you to see a single Figure
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  # allows you to view form to edit a single figure
  get '/figures/:id/edit' do 
    @figure =  Figure.find(params[:id])
    erb :'/figures/edit'
  end 

  # allows you to edit a single figure
  # shows you edited page 
  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
