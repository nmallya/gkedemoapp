class HealthCheckController < ActionController::Base
  def check
    head :ok
  end
end
