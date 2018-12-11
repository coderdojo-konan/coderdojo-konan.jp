class StaticpagesController < ApplicationController
  include ApplicationHelper

  def index
    @contact_form = ContactForm.new
    # @latest_event_url = next_event_url
  end
  def next_event_is_still_planned
  end
  def ninjas_works
  end
  def contact
    @contact_form = ContactForm.new
  end
  def contact_form_send

    @contact_form = ContactForm.new(contact_form_params)

    respond_to do |format|
      if @contact_form.save
        flash[:notice] = 'お問い合わせの送信が完了しました'
        format.html { redirect_to :action => "index" }
        format.json { render :show, status: :ok, location: @contact_form }
      else
        flash.now[:alert] = '入力に不備があるか、何かの不具合で送れませんでした。もう一度お試しください。'
        format.html { render :contact }
        format.json { render json: @contact_form.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    def contact_form_params
      params.require(:contact_form).permit(:name, :email, :subject, :body, :agreement_privacy_policy)
    end
end
