class Page
  attr_reader :id, :filename
  PAGES_PATH = 'db/pages'
  URL_PATH  = 'pages'

  class << self
    def all
      Dir.glob("#{PAGES_PATH}/*.md").map do |filename|
        Page.new(File.basename(filename, '.*'))
      end
    end
  end

  def initialize(filename)
    @filename = filename
  end

  def path
    "#{PAGES_PATH}/#{self.filename}.md"
  end

  def url
    "/#{self.filename}"
  end

  def exists?
    return false if path.include? "\u0000"
    File.exists?(path)
  end

  def description
    @desc  ||= exists? ? self.content.match(/\[desc:(.+)\]/)[1] : ''
  end

  def title
    @title ||= exists? ? self.content.match(/\[title:(.+)\]/)[1] : ''
  end

  def content
    @content ||= exists? ? File.read(path) : ''
  end
end
