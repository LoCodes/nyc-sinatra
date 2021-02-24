class LandmarksController < ApplicationController

  # LandmarksController allows you to list all landmarks
  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/index'
  end

  # allows you to view form to create a new landmark
  # allows you to create a new landmark
  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  # allows you to create a new landmark
  post '/landmarks' do
    Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
    redirect '/landmarks'
  end


  # allows you to see a single landmark
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  # allows you to view the form to edit a single landmark (FAILED - 1)
  # allows you to edit a single landmark
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  # shows landmark with edited value 
  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']['year_completed']
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

end