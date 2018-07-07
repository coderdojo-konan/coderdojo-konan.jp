class ContactForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  #include ActiveModel::Callbacks

  attr_accessor :name, :email, :subject, :body, :agreement_privacy_policy
  define_model_callbacks :save

  validates :name, presence: true
  validates :email, presence: true
  validates :subject, presence: true
  validates :body, presence: true
  validates :agreement_privacy_policy, presence: true

  validates_acceptance_of :agreement_privacy_policy, allow_nil: false
  def save
    run_callbacks :save do
      return false if invalid?
      @name = self.name
      @email = self.email
      @subject = self.subject
      @body = self.body

      bodyAttachments = {"title": "メンターお問いあわせ",
                          "text": "\n\n\n*Email* :\n" + @email +
                          "\n\n*お名前* :\n" + @name +
                          "\n\n*件名* :\n" + @subject +
                          "\n\n*本文* :\n" + @body
                          };

      massage_body = "<!channel> お問い合わせフォームより新しい通知が来ています！ \n"

      slack_notifer_client.post attachments: [bodyAttachments], text: massage_body
      true
    end
  end
  
  private
  def slack_notifer_client
    hooks_url = ENV['SLACK_INCOMING_WEBHOOKS_URL']
    Slack::Notifier.new hooks_url, channel: "#各種お問い合わせボード"
  end
end
