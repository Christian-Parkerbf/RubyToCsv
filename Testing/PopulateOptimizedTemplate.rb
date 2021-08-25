require 'csv'

headers = ['Item Type', 'Product ID', 'Product Name', 'Product Code/SKU', 'Product Type',
        'Category Details', 'Product Description', 'Price', 'Product Visible', 'Allow Purchases?',
        'Free Shipping', 'Product Weight', 'Product Width', 'Product Height', 'Product Depth',
        'Brand Name', 'Warranty', 'Product Condition', 'Show Product Condition?', 
        'Product Tax Class', 'Search Keywords', 'Page Title', 'Meta Keywords', 'Meta Description',
        'Product URL', 'Option Set Align', 'Stop Processing Rules', 'Product Custom Fields', 
        'Product Images', 'GPS Enabled', 'Date Added', 'Date Modified']
blank = ''

csv_file = File.read('C:\Users\ckimura\Downloads\products-2021-06-11 (7).csv')
csv_text = CSV.parse(csv_file, :headers => true)

CSV.open('output.csv', 'w', write_headers: true, headers: headers) do |csv|
  CSV.foreach('C:\Users\ckimura\Downloads\products-2021-06-11 (7).csv', headers:true) do |row|
    csv << [row['Item Type'], blank, row['Product Name'], blank, row['Product Type']]

  end
end