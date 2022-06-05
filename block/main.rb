# def exec_block
#   yield
# end

# exec_block { puts "Hello, World!!" }

proc1 = proc do |arg|
  puts "test #{arg}"
  return
end
proc2 = proc { |arg| puts "test #{arg}"  }
proc3 = lambda do |arg|
  puts "test #{arg}"
  return
end
proc4 = ->(arg) { puts "test #{arg}" }
proc5 = -> { puts "test #{arg}" }

def proc_test(block)
  block.call('hoge')

  puts "実行されない"
end

def lambda_test(block)
  block.call('piyo')

  puts "実行される"
end

# proc_test(proc1)

puts proc1.respond_to?(:to_proc)

# lambda_test(proc3)

# class Test
#   attr_reader :hoge
#   attr_accessor :piyo

#   def initialize
#     @hoge = 'hoge'
#     self.piyo = 'piyo'
#   end

#   def sample1
#     puts piyo
#   end

#   def sample2
#     puts hoge
#   end
# end

# test = Test.new

# test.sample1
