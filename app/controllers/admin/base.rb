class Admin::Base < ApplicationController
  before_action :sign_in_required
  layout 'admin'
end
