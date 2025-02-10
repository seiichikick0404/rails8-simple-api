class TasksController < ApplicationController
    def index
        @tasks = Task.all
        render json: @tasks
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            render json: @task, status: :created
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    def incomplete
        @tasks = Task.where(completed: false)
        render json: @tasks
    end

    private

    def task_params
        params.require(:task).permit(:title, :completed)
    end
end
