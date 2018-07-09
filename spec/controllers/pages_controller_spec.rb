require 'rails_helper'
include MarkdownHelper

RSpec.describe PagesController, type: :controller do
  describe "Request GET #index" do
    it "@pages が表示されること" do
      get :index
      expect(assigns(:pages).first.title).to eq Page.all.first.title
    end
  end

  describe "Request GET #show" do
    context "ファイル名が存在する時" do
      it "@content が表示されること" do
        param    = 'visit-interview'
        get :show, params: {:id => param}
        page      = Page.new(param)
        expected = MarkdownHelper.md_to_html page.content
        expect(assigns(:content)).to eq expected
      end
    end

    context "ファイル名が存在しない時" do
      it '404 エラーが返される こと' do
        expect { get :show, params: {:id => 'not_found_hoge_hoge'} }.to raise_error(ActionController::RoutingError)
      end
    end
  end
end
