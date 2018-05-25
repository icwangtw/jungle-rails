class Admin::DashboardController < ApplicationController
http_basic_authenticate_with :name => Rails.configuration.admin[:adminu], :password => Rails.configuration.admin[:adminp]
  def show
  end
end
