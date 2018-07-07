require 'rails_helper'

RSpec.describe ContactForm, type: :model do
  describe "#Save" do

    let(:contact_form) { ContactForm.new(params) }

    let(:params) { { name: name, email: email, subject: subject, body: body, agreement_privacy_policy: true} }


    describe "バリデーション" do

      before :each do
        contact_form.save
      end

      context "Name が空欄の時" do
        let(:name) {  }
        let(:email) { "ABE@TESTMAIL.COM" }
        let(:subject) { "Subject" }
        let(:body) { "ABCDEF BODY" }

        it "エラーを返すこと" do
          Rails.logger.info contact_form
          expect(contact_form.errors[:name]).to be_present
        end
      end

      context "E-mail が空欄の時" do
        let(:name) { "ABC NAME" }
        let(:email) {  }
        let(:subject) { "Subject" }
        let(:body) { "ABCDEF BODY" }

        it "エラーを返すこと" do
          expect(contact_form.errors[:email]).to be_present
        end
      end

      context "Subject が空欄の時" do
        let(:name) { "ABC NAME" }
        let(:email) { "ABE@TESTMAIL.COM" }
        let(:subject) {  }
        let(:body) { "ABCDEF BODY" }

        it "エラーを返すこと" do
          expect(contact_form.errors[:subject]).to be_present
        end
      end

      context "Body が空欄の時" do
        let(:name) { "ABC NAME" }
        let(:email) { "ABE@TESTMAIL.COM" }
        let(:subject) { "Subject" }
        let(:body) {  }

        it "エラーを返すこと" do
          Rails.logger.info contact_form
          contact_form.save
          expect(contact_form.errors[:body]).to be_present
        end
      end

    end

    describe "フォーム送信" do

      context "全ての項目が埋まっている時" do
        let(:name) { "ABC NAME" }
        let(:email) { "ABE@TESTMAIL.COM" }
        let(:subject) { "Subject" }
        let(:body) { "ABCDEF BODY" }

        let!(:slack_notifer_client_mock) { spy('Slack Notifer Client') }

        let(:massage_body) { "<!channel> お問い合わせフォームより新しい通知が来ています！ \n" }

        let(:bodyAttachments) {
          {"title": "メンターお問いあわせ",
            "text": "\n\n\n*Email* :\n" + email +
            "\n\n*お名前* :\n" + name +
            "\n\n*件名* :\n" + subject +
            "\n\n*本文* :\n" + body
          }
        }

        before do
          allow_any_instance_of(ContactForm).to receive(:slack_notifer_client).and_return(slack_notifer_client_mock)
        end

        it "フォームがエラーなく送信されること" do
          expect{ contact_form.save }.not_to raise_error
        end

        it "Slack に正しい情報が渡されること" do
          expect(slack_notifer_client_mock).to receive(:post)
          expect(contact_form.save).to be_truthy
        end

        it "それぞれのインスタンス変数に正しい値が代入されていること" do
          expect(contact_form.instance_variable_get :@name).to eq name
          expect(contact_form.instance_variable_get :@email).to eq email
          expect(contact_form.instance_variable_get :@subject).to eq subject
          expect(contact_form.instance_variable_get :@body).to eq body
        end
      end
    end
  end
end
