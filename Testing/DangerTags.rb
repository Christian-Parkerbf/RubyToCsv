require 'csv'

headers = ['Item Type', 'Product ID', 'Product Name', 'Product Code/SKU', 'Product Type',
        'Category Details', 'Product Description', 'Price', 'Product Visible', 'Allow Purchases?',
        'Free Shipping', 'Product Weight', 'Product Width', 'Product Height', 'Product Depth',
        'Brand Name', 'Warranty', 'Product Condition', 'Show Product Condition?', 
        'Product Tax Class', 'Search Keywords', 'Page Title', 'Meta Keywords', 'Meta Description',
        'Product URL', 'Option Set Align', 'Stop Processing Rules', 'Product Custom Fields',
        'Product Image File - 1', 'Product Image ID - 1', 'Product Image Description - 1', 
        'Product Image Is Thumbnail - 1', 'GPS Enabled', 'Date Added', 'Date Modified']

blank = ''
description = ""
warranty = "The manufacturer warrants this product to be free from defects in workmanship and materials."
keywords = ""
metakeywords = ""
metadescription = ""
productimagedescription = ""
productcustomfields = ""

def description(title)
    return "<p>" + title + " are used to inform workers in the field. This heavy duty outdoor rated tag is a required critical tool in safety, performance, and maintenance operations.</p>
    <p>Traditional OSHA-style signs, tags and labels are the most widely recognized design format in the industry.</p>"
end
def keywords(keytitle)
    return keytitle + ", tags, safety, safety tags, OSHA, tag"
end
def SKUNumber25(skutitle1)
    return skutitle1 + "-V-25"
end
def SKUNumber50(skutitle2)
    return skutitle2 + "-V-50"
end
def SKUNumber100(skutitle3)
    return skutitle3 + "-V-100"
end

csv_file = File.read('C:\Users\ckimura\Downloads\RubyToCsv\dangertags.csv')
csv_text = CSV.parse(csv_file, :headers => true)

CSV.open('output.csv', 'w', write_headers: true, headers: headers) do |csv|
  CSV.foreach('C:\Users\ckimura\Downloads\RubyToCsv\dangertags.csv', headers:true) do |row|
    csv << [
        'Product',
        blank, #always leave blank
        row['Product Name'], 
        row['Product Code/SKU'], 
        'P',
        row['Category Details'], 
        description(row['Product Name']), 
        row['Price'], 
        'Yes', 
        'Yes',
        'No', 
        '0.25', 
        blank, 
        blank, 
        blank,
        'Parker', 
        warranty, 
        'New', 
        'No', 
        'Default Tax Class', 
        keywords(row['Product Name']), #keywords description
        row['Product Name'], 
        metakeywords, 
        metadescription,
        blank, 
        'Right', 
        'No', 
        productcustomfields, 
        row['Image'],
        blank, #always leave blank
        row['Product Name'], #product image description
        'Yes',
        'No', 
        blank, 
        blank
    ]
    csv << [
        '  SKU',
        blank, 
        '[S]Material=Rigid Vinyl (Plastic),[S]Unit of Measure=25/Pack', 
        SKUNumber25(row['Product Code/SKU']), 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank
    ]
    csv << [
        '  SKU',
        blank, 
        '[S]Material=Rigid Vinyl (Plastic),[S]Unit of Measure=50/Pack', 
        SKUNumber50(row['Product Code/SKU']), 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank
    ]
    csv << [
        '  SKU',
        blank, 
        '[S]Material=Rigid Vinyl (Plastic),[S]Unit of Measure=100/Pack', 
        SKUNumber100(row['Product Code/SKU']), 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank
    ]
    csv << [
        '  Rule',
        blank, 
        blank, 
        SKUNumber25(row['Product Code/SKU']), 
        blank,
        blank, 
        blank, 
        '[FIXED]39', 
        'Y', 
        'Yes',
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank
    ]
    csv << [
        '  Rule',
        blank, 
        blank, 
        SKUNumber50(row['Product Code/SKU']), 
        blank,
        blank, 
        blank, 
        '[FIXED]62.5', 
        'Y', 
        'Yes',
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank
    ]
    csv << [
        '  Rule',
        blank, 
        blank, 
        SKUNumber100(row['Product Code/SKU']), 
        blank,
        blank, 
        blank, 
        '[FIXED]99', 
        'Y', 
        'Yes',
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank, 
        blank, 
        blank,
        blank, 
        blank, 
        blank
    ]
  end
end