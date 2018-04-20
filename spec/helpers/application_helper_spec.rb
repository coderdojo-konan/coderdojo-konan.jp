require 'rails_helper'

describe ApplicationHelper do
  describe "full_title" do
    context "when plovided title is nil or empty" do
      it "plovided title is nil" do
        plovided_title = nil
        expect(full_title(plovided_title)).to eq "CoderDojo Konan Okayama Official Site"
      end
      it "plovided title is empty" do
        plovided_title = ""
        expect(full_title(plovided_title)).to eq "CoderDojo Konan Okayama Official Site"
      end
    end
    context "when it is plovided then" do
      it "has plovided title" do
        plovided_title = "Test Page"
        expect(full_title(plovided_title)).to eq "#{plovided_title} | CoderDojo Konan Okayama Official Site"
      end
    end
  end
  describe "Next event url helper" do
    it "is return true url when next event is always planned" do
    end
  end

  describe 'next_event_url' do
    before do
      allow_any_instance_of(ApplicationHelper).to receive(:get_latest_event) { value }
    end

    subject{ next_event_url }

    let(:value) do
      { started_at: '2018-04-10', event_url: 'http://example.com' }.stringify_keys
    end

    context '現在日付が開催前の場合' do
      before do
        Timecop.travel(Date.new(2018, 4, 9))
      end
      it 'イベントURLを返すこと' do
        is_expected.to eq 'http://example.com'
      end
    end

    context '現在日付が開催日以降の場合' do
      before do
        Timecop.travel(Date.new(2018, 4, 10))
      end
      it 'nilを返すこと' do
        is_expected.to be_nil
      end
    end
  end
end