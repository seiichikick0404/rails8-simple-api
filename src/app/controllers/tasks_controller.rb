class TasksController < ApplicationController
    def index
        @tasks = Task.all
        render json: @tasks
    end

    def incomplete
        @tasks = Task.where(completed: false)
        render json: @tasks
    end
end
