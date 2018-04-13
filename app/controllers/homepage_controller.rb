class HomepageController < ApplicationController
  def index
    @logs = Log.all
  end

  def create
    @log = Log.new(params: params.except(:action, :controller), date: DateTime.now)
    @log.save

    if ENV['SLACK_WEBHOOK_URL']
      HTTParty.post(
          ENV['SLACK_WEBHOOK_URL'],
          body: {:text => "Webhook triggered: \n Alert ID: #{params['alert_id']} \n Alert Name: #{params['alert_name']}"}.to_json,
          headers: {'Content-Type' => 'application/json'}
      )
    end
    render json: @log
  end
end