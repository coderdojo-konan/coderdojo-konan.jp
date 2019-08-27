module ApplicationHelper
  def full_title(page_title)
      base_title = "CoderDojo Konan Okayama Official Site"
      if page_title.blank?
        base_title
      else
        "#{page_title} - #{base_title}"
      end
  end

  def next_event_url
    latest_event = get_latest_event
    if !latest_event.nil?
      if Date.parse(latest_event['starts_at']) > Date.today
        latest_event['public_url']
      else
        nil
      end
    else
      nil
    end
  end

  private
  def get_latest_event
    begin
     response = rest_client('/groups/coderdojo-konan/events').get params: { :locale => 'ja', :sort => 'starts_at' }

     json = JSON.parse response.body
     json.present? ? json.first['event'] : nil
    rescue RestClient::ExceptionWithResponse => e
     nil
    end
  end
  def rest_client(url)
    RestClient::Resource.new "https://api.doorkeeper.jp#{url}"
  end
end
