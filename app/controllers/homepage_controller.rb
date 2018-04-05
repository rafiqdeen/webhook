class HomepageController < ApplicationController
  def index
    @logs = Log.all
  end

  def create
    @log = Log.new(params: params.except(:action, :controller), date: DateTime.now)
    @log.save
    render json: @log
  end
end