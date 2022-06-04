module A
  module ClassMethods
    def hello
      'hello'
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end

class B
  include A
end

module C
  def hoge
    hello
  end
end

class M < B
  extend C
end

p M.hoge
