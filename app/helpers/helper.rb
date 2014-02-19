def gen_short_url
  (0...8).map { (65 + rand(26)).chr }.join
end

def validate_passwords(p1, p2)
  p1 == p2
end
