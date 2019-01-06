class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :put_ver_link

  def after_sign_in_path_for(resource)
    admin_path
  end
  def after_sign_up_path_for(resource)
    admin_path
  end
  def after_account_update_path_for(resource)
    admin_path
  end
  def after_sign_out_path_for(resource)
    admin_path
  end

  private
    def put_ver_link
      @header_links = [
        { url:  "/", text: "TOP" },
        { url:  "/visit-interview", text: "見学・取材について" },
        { url:  "/f-and-q", text: "よくある質問 (F&Q)" },
        { url: "/ninjas-works", text: "参加した Ninja の作品" },
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

    def sign_in_required
       redirect_to new_user_session_url unless user_signed_in?
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :display_name, :approved, :role])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :display_name, :approved, :role])
    end

end
