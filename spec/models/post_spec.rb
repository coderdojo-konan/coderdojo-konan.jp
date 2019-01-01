require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "#Save" do
    let(:post) { Post.new(params) }

    let(:params) { { body: body, title: title, published_at: published_at, user_id: user_id, slug: slug, is_draft: is_draft} }

    describe "バリデーション" do
      before :each do
        post.save
      end

      context "body が空欄の時" do
        let(:body) {  }
        let(:title) { "TITLE HOGE" }
        let(:published_at) { "2018-08-17 18:30:48" }
        let(:user_id) { 1 }
        let(:slug) { "HOGE SLUG" }
        let(:is_draft) { false }

        it "エラーを返すこと" do
          Rails.logger.info post
          expect(post.errors[:body]).to be_present
        end
      end

      context "slug が空欄の時" do
        let(:body) { "HOGE BODY" }
        let(:title) { "TITLE HOGE" }
        let(:published_at) { "Subject" }
        let(:user_id) { "ABCDEF BODY" }
        let(:slug) { }
        let(:is_draft) { false }

        it "エラーを返すこと" do
          Rails.logger.info post
          expect(post.errors[:slug]).to be_present
        end
      end

      context "title が空欄の時" do
        let(:body) { "HOGE BODY" }
        let(:title) { }
        let(:published_at) { "Subject" }
        let(:user_id) { "ABCDEF BODY" }
        let(:slug) { "HOGE SLUG" }
        let(:is_draft) { false }

        it "エラーを返すこと" do
          Rails.logger.info post
          expect(post.errors[:title]).to be_present
        end
      end
    end
  end
end
