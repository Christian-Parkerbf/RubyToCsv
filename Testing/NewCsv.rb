require 'csv'


header = ['Item Type', 'Product ID', 'Product Name', 'Product Type', 'Product Code/SKU', 'Bin Picking Number', 'Brand Name',
          'Option Set', 'Option Set Align', 'Product Description', 'Price', 'Cost Price', 'Retail Price', 'Sale Price', 'Fixed Shipping Cost',
          'Free Shipping', 'Product Warranty', 'Product Weight', 'Product Width', 'Product Height', 'Product Depth', 'Allow Purchases?', 'Product Visible?',
          'Product Availability', 'Track Inventory', 'Current Stock Level', 'Low Stock Level', 'Category', 'Product Image ID - 1', 'Product Image File - 1',
          'Product Image Description - 1', 'Product Image Is Thumbnail - 1', 'Product Image Sort - 1', 'Search Keywords', 'Page Title', 'Meta Keywords',
          'Meta Description', 'Product Condition', 'Show Product Condition?', 'Sort Order', 'Product Tax Class', 'Product UPC/EAN', 'Stop Processing Rules',
          'Product URL', 'Redirect Old URL?', 'GPS Global Trade Item Number', 'GPS Manufacturer Part Number', 'GPS Gender', 'GPS Age Group', 'GPS Color',
          'GPS Size', 'GPS Material', 'GPS Pattern', 'GPS Item Group ID', 'GPS Category', 'GPS Enabled', 'Tax Provider Tax Code', 'Product Custom Fields']

csv_file = File.read('C:\Users\ckimura\Downloads\PythonToCsv\ReadAndWrite.csv')
csv_text = CSV.parse(csv_file, :headers => true)

CSV.open('output.csv', 'w', write_headers: true, headers: header) do |csv|
  CSV.foreach('C:\Users\ckimura\Downloads\PythonToCsv\ReadAndWrite.csv', headers:true) do |row|
    csv << [row['Item Type'][2], row['Product Name'], row['Product Type'], row['Product Code/SKU'], "Fixed text of something"]

  end
end