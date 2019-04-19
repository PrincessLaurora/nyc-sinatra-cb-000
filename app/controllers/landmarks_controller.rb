class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

   get '/landmarks/new' do
     erb :'/landmarks/new'
   end

   get '/landmarks/:id' do
     @landmark = Landmark.find_by_id(params[:id])
     erb :'/landmarks/show'
   end

   post '/landmarks' do
       @landmark = Landmark.create(params["landmark"])
       @landmark.save
       redirect("/landmarks/#{@landmark.id}")
     end

     get '/landmarks/:id/edit' do
       @landmark = Landmark.find_by_id(params[:id])
       erb :'/landmarks/edit'
     end

     patch '/figures/:id' do
       @landmark = Landmark.find_by_id(params[:id])
       @figure.update(params["figure"])
       if !params["landmark"]["name"].empty?
       @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
       end
       if !params["title"]["name"].empty?
       @figure.titles << Title.create(name: params["title"]["name"])
       end
       @figure.save
       redirect("/figures/#{@figure.id}")
     end
end
