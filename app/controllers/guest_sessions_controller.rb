class GuestSessionsController < ApplicationController
    skip_before_action :login_required

    def create
      user = User.find_by(email: 'guest@example.com')
      log_in(user)
      flash[:success] = 'ゲストユーザーでログインしました'
      flash[:warning] = 'よろしくお願いします！'
      redirect_to todo_tasks_path(user)
    end

end
