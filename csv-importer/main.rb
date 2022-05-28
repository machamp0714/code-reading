# https://github.com/pcreux/csv-importer

module Example
  def hello
    puts 'hello'
  end
end

module CSVImporter
  class Error < StandardError; end

  # includeされたとき、対象のクラスが自身を引数にして呼び出す
  def self.included(klass)
    puts klass
    klass.extend(Example)
    # レシーバにクラスメソッドを定義する
    klass.define_singleton_method(:config) do
      @config ||= 'config'
    end
  end

  class Configurator < Struct.new(:config)
    include Example
  end

  def initialize(*args, &block)
    # レシーバのコンテキストでブロックを実行する
    Configurator.new(@config).instance_exec(&block) if block
  end
end

class Test
  include CSVImporter
end
