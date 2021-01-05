class WorkoutsController < ApplicationController
    get '/workouts' do
        @workouts = Workout.all
        erb :'/workouts/index'
    end

    get '/workouts/new' do
        erb :'/workouts/new'
    end

    get '/workouts/:id' do
        @workout = Workout.find_by_id(params[:id])
        erb :'workouts/show'
    end

    post '/workouts' do
        workout = Workout.new(params[:workout])

        if workout.save
            redirect '/workouts'
        else
            redirect '/workouts/new'
        end
    end

    
end