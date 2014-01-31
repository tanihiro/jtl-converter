require 'thor'
require 'jtl_converter/gruff'
require 'jtl_converter/report'
 
module JtlConverter
  class Command < Thor

    option :interval, :type => :string,  :default => 10_000
    option :img_path, :type => :string,  :default => 'img'
    desc "image", "convert to image"
    def image(jtl_file)
      jtl_gruff = JtlConverter::Gruff.new jtl_file, options[:interval], options[:img_path]
      jtl_gruff.all
    end

    desc "text", "convert to text"
    def text(jtl_file)
      jtl_report = JtlConverter::Report.new jtl_file
      jtl_report.output
    end

  end
end
