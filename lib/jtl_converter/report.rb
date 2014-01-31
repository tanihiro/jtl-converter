require 'jtl'

module JtlConverter
  class Report
    
    def initialize(jtl_file)
      @jtl = Jtl.new(jtl_file)
    end

    def output
      rows = []
      rows << [
        'Label',
        'Samples',
        'Average',
        'Median',
        'Min',
        'Max',
        'Error%',
        'req/sec',
      ]
      @jtl.labels.each do |label|
        rows << data_to_row(label, @jtl.elapseds[label])
      end
      rows << data_to_row('Total', @jtl.elapseds)
      puts rows.map {|i| i.join("\t") }.join("\n")
    end

    private 
    def data_to_row(label, data_set)
      [
        label.slice(0, 7),
        data_set.flatten.length,
        data_set.flatten.mean.to_i,
        data_set.flatten.median.to_i,
        data_set.flatten.min,
        data_set.flatten.max,
        error_rate(data_set.flatten),
        data_set.map {|i| i.length }.mean.to_i
      ]
    end

    def error_rate(data)
      100.0 * data.count {|i| !i } / data.length
    end

  end
end
