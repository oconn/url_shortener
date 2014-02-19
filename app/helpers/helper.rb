def gen_short_url
  loop do
    @short = (0...8).map { (65 + rand(26)).chr }.join
    break if Url.where(short_url: @short).empty?
  end
  @short
end

def validate_passwords(p1, p2)
  p1 == p2
end
