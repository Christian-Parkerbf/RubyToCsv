require 'csv'
require_relative 'MasterlockCSVFile'

def skuName(color)
    return "[S]" + color.to_s
end
def category(cat1, cat2, cat3)
    return "Masterlock/" + cat1 + '/' + cat2 + '/' + cat3
end
def description(desc1, desc2)
    return "<p>" + desc1 + "</p> <p>" + desc2 + "</p>"
end
def productcustomfields(custom1, custom2, custom3, custom4, custom5, custom6, custom7, custom8, custom9)
    return custom1.to_s + "; " +
    custom2.to_s + "; " +
    custom3.to_s + "; " +
    custom4.to_s + "; " +
    custom5.to_s + "; " +
    custom6.to_s + "; " +
    custom7.to_s + "; " +
    custom8.to_s + "; " +
    custom9.to_s + "; "
end

$parent_id_list = []

CSV.open('output.csv', 'w', write_headers: true, headers: $headers) do |csv|
    CSV.foreach('C:\Users\ckimura\Downloads\RubyToCsv\Masterlock\MasterlockLockoutTagout V3 Personal.csv', headers:true) do |row|

        if row['Parent'].nil?
            $ProductCSV
        elsif !$parent_id_list.include? row['Parent']
            $ProductCSV
            $SKUCSV
            $ParentCSV
        else 
            $SKUCSV
        end
    end
end