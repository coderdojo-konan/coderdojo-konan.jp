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
      render :action => "not_found_404",  :status => 404
    end
    @content = MarkdownHelper.md_to_html @page.content
    @url = request.url
  end

  def not_found_404
  end
end
