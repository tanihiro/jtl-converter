require 'jtl'
require 'gruff'

module JtlConverter
  class Gruff
    
    def initialize(jtl_file, interval = 10_000, img_path = 'img')
      @jtl      = Jtl.new(jtl_file, interval: interval)
      @img_path = img_path
      Dir::mkdir @img_path unless File.exists? @img_path
    end

    def all
      elapsed
      success
      response_code
    end

    def elapsed
      g_line = create_gruff_line 'elapsed (avg)'
      g_line.data :all, @jtl.elapseds {|i| i.mean }
      @jtl.labels.each do |label|
        g_line.data label.to_sym, @jtl.elapseds.send(label) {|i| i.mean }
      end
      g_line.write("#{@img_path}/elapsed.png")
    end

    def success
      g_line = create_gruff_line 'success'
      categorization_gruff_line g_line, @jtl.successes
      @jtl.labels.each { |label| categorization_gruff_line g_line, @jtl.successes.send(label), "#{label}_" }
      g_line.write("#{@img_path}/success.png")
    end

    def response_code
      g_line = create_gruff_line 'response_code'
      categorization_gruff_line g_line, @jtl.response_codes
      @jtl.labels.each { |label| categorization_gruff_line g_line, @jtl.response_codes.send(label), "#{label}_" }
      g_line.write("#{@img_path}/response_code.png")
    end

    private 
    # Gruffインスタンスを生成します
    def create_gruff_line(title)
      g_line = ::Gruff::Line.new
      g_line.title = title
      g_line.labels = @jtl.scale_marks.map {|i| i.strftime('%H:%M:%S') }.to_gruff_labels
      g_line
    end

    # 値ごとの数を計算して折れ線グラフの値にします
    def categorization_gruff_line(gruff_line, values, prefix = 'all_')
      counts = {}
      values.each do |value|
        value.each do |v|
          counts[v.to_s] ||= []
        end
        counts.keys.each do |key|
          counts[key].push(value.select {|v| v.to_s == key }.length)
        end
      end
      counts.each do |key, count|
        gruff_line.data "#{prefix}#{key}".to_sym, count
      end
    end

  end
end
