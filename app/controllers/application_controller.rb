class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :put_ver_link

  private
    def put_ver_link
      @header_links = [
        { url:  "/", text: "TOP" },
        { url:  "/visit-interview", text: "見学・取材について" },
        { url:  "/f-and-q", text: "よくある質問 (F&Q)" },
        { url: "/join-as-mentor", text: "メンターとして参加する" }
      ]

      @footer_links = [
        { url: "/pages", text: "ページ一覧" },
        { url: "/regulation", text: "会則" },
        { url:  "/visit-interview", text: "見学・取材について" },
        { url:  "/f-and-q", text: "よくある質問 (F&Q)"},
        { url: "/privacy-policy", text: "Privacy & Policy（個人情報保護方針）"}
      ]
    end
end
