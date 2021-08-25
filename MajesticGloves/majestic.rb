require 'csv'

# WARRANTY: https://www.majesticglove.com/prop65
# Images: find and replace /56x with ""

headers = ['Item Type', 'Product ID', 'Product Name', 'Product Code/SKU', 'Product Type',
        'Category', 'Product Description', 'Price', 'Product Visible', 'Allow Purchases?',
        'Free Shipping', 'Product Weight', 'Product Width', 'Product Height', 'Product Depth',
        'Brand Name', 'Product Warranty', 'Product Condition', 'Show Product Condition?', 
        'Product Tax Class', 'Search Keywords', 'Page Title', 'Meta Keywords', 
        'Meta Description', 'Product URL', 'Option Set', 'Option Set Align', 
        'Stop Processing Rules', 'Product Custom Fields', 'Product Image File - 1', 
        'Product Image ID - 1', 'Product Image Description - 1', 'Product Image Is Thumbnail - 1', 
        'Product Image Sort - 1', 'GPS Enabled', 'Date Added', 'Date Modified', 'Product Image File - 2', 
        'Product Image ID - 2', 'Product Image Description - 2', 'Product Image Is Thumbnail - 2', 
        'Product Image Sort - 2', 'Product Image File - 3', 'Product Image ID - 3', 
        'Product Image Description - 3', 'Product Image Is Thumbnail - 3', 'Product Image Sort - 3']

blank = ''

def customfields(cust1, cust2, warran1, warran2)
  "Cutsheet = <a href='" + cust1.to_s + "' target='_blank'>" + cust1.to_s + "</a> <br>" +
  "Cutsheet = <a href='" + cust2.to_s + "' target='_blank'>" + cust2.to_s + "</a> <br>" +
  "Majestic Glove Prop 65 = <a href='" + warran1.to_s + "' target='_blank'>" + warran1.to_s + "</a><br>;" +
  "Prop 65 Warning = <a href='" + warran2.to_s + "' target='_blank'>" + warran2.to_s + "</a><br>"
end
def searchkeywords(keytitle)
    return keytitle + ", Majestic, majestic gloves, majesticgloves"
end

CSV.open('output.csv', 'w', write_headers: true, headers: headers) do |csv|
  CSV.foreach('MajesticGlovesURLLoop.csv', headers:true) do |row|
    
    csv << [
        'Product',
        blank, #always leave blank
        row['Title'], 
        row['ProductCode'], 
        'P',
        'Majestic', 
        row['DescriptionHTML'], 
        '25.00', 
        'Yes', 
        'Yes',
        'No', 
        blank, 
        blank, 
        blank, 
        blank,
        'Majestic Gloves', 
        blank, 
        'New', 
        'No', 
        'Default Tax Class', 
        searchkeywords(row['PageTitle']),
        row['PageTitle'], 
        row['Meta_keywords'], 
        row['Meta_Description'],
        blank,
        blank, 
        'Right', 
        'No', 
        customfields(row['AddInfo1'], row['AddInfo2'], row['MGWarranty'], row['WarrantyWarning']), 
        row['PrimaryImageURL'], # REPLACE 'THUMBNAIL' WITH 'IMAGE' IN IMAGEURL
        blank, #always leave blank
        row['Title'], #product image description
        'Yes',
        '1',
        'No', 
        blank, 
        blank,
        row['Image2'], # REPLACE 'THUMBNAIL' WITH 'IMAGE' IN IMAGEURL
        blank, #always leave blank
        row['Title'], #product image description
        'No',
        '2',
        row['Image3'], # REPLACE 'THUMBNAIL' WITH 'IMAGE' IN IMAGEURL
        blank, #always leave blank
        row['Title'], #product image description
        'No',
        '3'
    ]
  end
end