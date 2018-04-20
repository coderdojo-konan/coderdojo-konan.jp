module ApplicationHelper
  def full_title(page_title)
      base_title = "CoderDojo Konan Okayama Official Site"
      if page_title.blank?
        base_title
      else
        "#{page_title} | #{base_title}"
      end
  end

  def next_event_url
    latest_event = get_latest_event
    if Date.parse(latest_event['started_at']) > Date.today
      latest_event['event_url']
    else
      nil
    end
  end

  private
  def get_latest_event
    response = rest_client.get(params: {:series_id => 3786, :order => 2})
    json = JSON.parse(response.body)
    json['events'].first
  end
  def rest_client
    RestClient::Resource.new 'https://connpass.com/api/v1/event/'
  end
end
