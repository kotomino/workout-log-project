class WorkoutsController < ApplicationController
    get '/workouts' do
        redirect_if_not_logged_in
        @workouts = current_user.workouts
        @workout = Workout.find_by_id(session[:workout_id])
        @user = User.find_by_id(session[:user_id])
        
        erb :'/workouts/index'
    end

    get '/workouts/new' do
        redirect_if_not_logged_in
        erb :'/workouts/new'
    end

    get '/workouts/:id' do
        redirect_if_not_logged_in
        find_workout
        session[:workout_id] = @workout.id if @workout
        redirect_if_workout_not_found
        redirect_if_not_owner
        erb :'/workouts/show'
    end

    get '/workouts/:id/edit' do
        redirect_if_not_logged_in
        find_workout
        redirect_if_workout_not_found
        redirect_if_not_owner
        erb :'/workouts/edit'
    end

    post '/workouts' do
        workout = current_user.workouts.build(params[:workout])
        if workout.save
            redirect '/workouts'
        else
            flash[:errors] = workout.errors.full_messages
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
        redirect_if_workout_not_found
        redirect_if_not_owner
        @workout.destroy
        redirect "/workouts"
    end

    private

    def find_workout
        @workout = Workout.find_by_id(params[:id])
    end

    def redirect_if_workout_not_found
        flash[:errors] = ["Workout not found."]
        redirect "/workouts" unless @workout
    end

    def redirect_if_not_owner
        flash[:errors] = ["Workout not found."]
        redirect "/workouts" unless @workout.user == current_user
    end
    
end