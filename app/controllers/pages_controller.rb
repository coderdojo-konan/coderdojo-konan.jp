include MarkdownHelper

class PagesController < ApplicationController
  def index
    @title = 'ページ一覧'
    @pages = Page.all
    @url = request.url
  end

  def show
    @page = Page.new(params[:id])
    unless @page.exists?
      raise ActionController::RoutingError.new(params[:path])
    end
    @content = markdown @page.content
    @url = request.url
  end
end
