class WorkoutsController < ApplicationController
    get '/workouts' do
        @workouts = Workout.all
        @workout = Workout.find_by_id(session[:workout_id])
        erb :'/workouts/index'
    end

    get '/workouts/new' do
        erb :'/workouts/new'
    end

    get '/workouts/:id' do
        find_workout
        session[:workout_id] = @workout.id if @workout
        redirect_if_workout_not_found
        erb :'/workouts/show'
    end

    get '/workouts/:id/edit' do
        find_workout
        redirect_if_workout_not_found
        erb :'/workouts/edit'
    end

    post '/workouts' do
        workout = Workout.new(params[:workout])

        if workout.save
            redirect '/workouts'
        else
            redirect '/workouts/new'
        end
    end
    
    patch '/workouts/:id' do
        find_workout
        if @workout.update(params[:workout])
            redirect "/workouts/#{@workout.id}"
        else
            redirect "/workouts/#{@workout.id}/edit"
        end
    end

    delete '/workouts/:id' do
        find_workout
        @workout.destroy if @workout
        redirect "/workouts"
    end

    private

    def find_workout
        @workout = Workout.find_by_id(params[:id])
    end

    def redirect_if_workout_not_found
        redirect "/workouts" unless @workout
    end
    
end