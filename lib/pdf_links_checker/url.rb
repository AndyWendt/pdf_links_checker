class URL
  def initialize(pdf_link)
    @pdf_link = pdf_link
  end

  def invalid?
    uri = to_s
    url = URI.parse(uri)
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = true if uri.include?("https")

    begin
      res = req.request_head(url.path)
      true if res.code == "404"
    rescue StandardError => e
      true
    end
  end

  def to_s
    pdf_link[:A][:URI]
  end

  private

  attr_reader :pdf_link
end
