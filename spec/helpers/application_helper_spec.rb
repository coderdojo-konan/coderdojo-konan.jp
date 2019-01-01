require 'rails_helper'

describe ApplicationHelper do
  describe "full_title" do
    context "provide された Title が Nil の時" do
      it "'CoderDojo Konan Okayama Official Site' を返すこと" do
        plovided_title = nil
        expect(full_title(plovided_title)).to eq "CoderDojo Konan Okayama Official Site"
      end
    end
    context "provide された Title が Empty の時" do
      it "'CoderDojo Konan Okayama Official Site' を返すこと" do
        plovided_title = ""
        expect(full_title(plovided_title)).to eq "CoderDojo Konan Okayama Official Site"
      end
    end
    context "Title が provide されている時" do
      it "'{Title} - CoderDojo Konan Okayama Official Site' を返すこと" do
        plovided_title = "Test Page"
        expect(full_title(plovided_title)).to eq "#{plovided_title} - CoderDojo Konan Okayama Official Site"
      end
    end
  end

  # describe 'next_event_url' do
  #   before do
  #     allow_any_instance_of(ApplicationHelper).to receive(:get_latest_event) { value }
  #   end
  #
  #   subject{ next_event_url }
  #
  #   let(:value) do
  #     { started_at: '2018-04-10', event_url: 'http://example.com' }.stringify_keys
  #   end
  #
  #   context '現在日付が開催前の場合' do
  #     before do
  #       Timecop.travel(Date.new(2018, 4, 9))
  #     end
  #     it 'イベントURLを返すこと' do
  #       is_expected.to eq 'http://example.com'
  #     end
  #   end
  #
  #   context '現在日付が開催日以降の場合' do
  #     before do
  #       Timecop.travel(Date.new(2018, 4, 10))
  #     end
  #     it 'nilを返すこと' do
  #       is_expected.to be_nil
  #     end
  #   end
  # end
end
