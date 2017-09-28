def prefill(n, v='undefined')
  Array.new(type_check(n), v)
end

def type_check(n)
  return n if n.class == Fixnum && n >= 0
  return n.to_i if n.class == String && n.is_integer?
  raise TypeError.new("#{n} is invalid")
end

class String
  def is_integer?
    self.to_i.to_s == self && self.to_i >= 0
  end
end
