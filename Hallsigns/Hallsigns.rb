require 'csv'

headers = ['Item Type', 'Product ID', 'Product Name', 'Product Code/SKU', 'Product Type',
    'Category', 'Product Description', 'Price', 'Product Visible', 'Allow Purchases?', 
    'Product Availability', 'Free Shipping', 'Product Weight', 'Product Width', 'Product Height', 'Product Depth',
    'Brand Name', 'Product Warranty', 'Product Condition', 'Show Product Condition?', 
    'Product Tax Class', 'Search Keywords', 'Page Title', 'Meta Keywords', 'Meta Description',
    'Product URL', 'Option Set', 'Option Set Align', 'Stop Processing Rules', 'Product Custom Fields',
    'Product Image File - 1', 'Product Image ID - 1', 'Product Image Description - 1', 
    'Product Image Is Thumbnail - 1', 'GPS Enabled', 'Date Added', 'Date Modified', 
    'Product Image File - 2', 'Product Image ID - 2', 'Product Image Description - 2', 
    'Product Image Is Thumbnail - 2']

blank = ''
parent_id_list = []

def productcustomfields(custom1, custom2, custom3, custom4, custom5, custom6)
    return custom1.to_s + "; " +
    custom2.to_s + "; " +
    custom3.to_s + "; " +
    custom4.to_s + "; " +
    custom5.to_s + "; " +
    custom6.to_s + "; "
end
def skuName(opt1, opt2, opt3, opt4, opt5, opt6, opt7, opt8)
    return "[RT]" + opt1 +", [RT]" + opt2 + ", [RT]" + opt3 + ", [RT]" + opt4 + 
    ", [RT]" + opt5 + ", [RT]" + opt6 + ", [RT]" + opt7 + ", [RT]" + opt8
end
def category(cat1, cat, cat3)
  return "HallSigns/" + cat1 + "/" + cat2 + "/" + cat3
  # in output.csv find and replace "///" and "//" with " "
  # hallsigns in the input csv delete the category cells that are the same as the ProductName 
end

csv_file = File.read('C:\Users\ckimura\Downloads\RubyToCsv\Tags\cautiontags.csv')
csv_text = CSV.parse(csv_file, :headers => true)

CSV.open('output.csv', 'w', write_headers: true, headers: headers) do |csv|
  CSV.foreach('C:\Users\ckimura\Downloads\RubyToCsv\Tags\cautiontags.csv', headers:true) do |row|

    if row['Parent'].nil?
      csv << [
          'Product',
          blank, #always leave blank
          row['ProductName'], 
          row['PartNum'], 
          'P',
          category(row['Category1'], row['Category2'], row['Category3']), 
          row['DescriptionHTML']
          row['Price'], 
          'Yes', 
          'Yes',
          blank,
          'No', 
          blank, 
          blank, 
          blank, 
          blank, 
          'Hall Signs', 
          row["Warranty"], 
          'New', 
          'No', 
          'Default Tax Class', 
          blank, #keywords description
          row['PageTitle'], 
          row['Meta_keywords'], 
          blank,
          blank, #product url leave blank for now
          blank, 
          'Right', 
          'No', 
          productcustomfields(row["CustomField1"], row["customField2"], row["CustomField3"], row["CustomField4"], row["CustomField5"], row["CustomField6"]),
          row['ImageURL1'], #For hallsigns: go into Output.csv and replace "500X659" with "original". Do this on every image url column
          blank, #always leave blank
          row['ProductName'], #Product Image Description
          'Yes', #Yes on the first and no on subsequent images (usually)
          'No', 
          blank, 
          blank,
          row['ImageURL2'], #For masterlock: go into Output.csv and replace "375" with "orig". Do this on every image url column
          blank, #always leave blank
          row['ProductName'], #Product Image Description
          'No'
      ]

    elsif !parent_id_list.include? row['Parent']

      csv << [
        'Product',
        blank, #always leave blank
        row['ProductName'], 
        row['PartNum'], 
        'P',
        category(row['Category1'], row['Category2'], row['Category3']), 
        row['DescriptionHTML']
        row['Price'], 
        'Yes', 
        'Yes',
        blank,
        'No', 
        blank, 
        blank, 
        blank, 
        blank,
        'Hall Signs', 
        row["Warranty"], 
        'New', 
        'No', 
        'Default Tax Class', 
        blank, #keywords description
        row['PageTitle'], 
        row['Meta_keywords'], 
        blank,
        blank, #product url leave blank for now
        blank, 
        'Right', 
        'No', 
        productcustomfields(row["CustomField1"], row["CustomField2"], row["CustomField3"], row["CustomField4"], row["CustomField5"], row["CustomField6"]),
        row['ImageURL1'], #For hallsigns: go into Output.csv and replace "500X659" with "original". Do this on every image url column
        blank, #always leave blank
        row['ProductName'], #Product Image Description
        'Yes', #Yes on the first and no on subsequent images (usually)
        'No', 
        blank, 
        blank,
        row['ImageURL2'], #For masterlock: go into Output.csv and replace "375" with "orig". Do this on every image url column
        blank, #always leave blank
        row['ProductName'], #Product Image Description
        'No'
    ]

      csv << ["   SKU", blank, skuName(row['VarOpt1'], row['VarOpt2'], row['VarOpt3'], row['VarOpt4'], row['VarOpt5'], row['VarOpt6'], row['VarOpt7'], row['VarOpt8']),
          row['PartNum'], blank, blank, blank, blank, blank, blank, blank, blank, blank, 
          blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
          blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
          blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
          blank, blank, blank, blank, blank, blank, blank, blank
          ]

      parent_id_list << row['Parent']

    else

      csv << ["   SKU", blank, skuName(row['VarOpt1'], row['VarOpt2'], row['VarOpt3'], row['VarOpt4'], row['VarOpt5'], row['VarOpt6'], row['VarOpt7'], row['VarOpt8']),
          row['PartNum'], blank, blank, blank, blank, blank, blank, blank, blank, blank, 
          blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
          blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
          blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
          blank, blank, blank, blank, blank, blank, blank, blank
          ]

    end
  end
end