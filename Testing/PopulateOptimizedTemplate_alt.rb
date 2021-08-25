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
warranty = "<p>long list of continuous words we might not want to deviate from a single line/paragraph of words.</p>"
keywords = "supercalifragilisticexpialidocious"
metakeywords = "Mahi-Mahi"
metadescription = ""
productimagedescription = "this is a picture"
productcustomfields = "we also need to remember=that productcustomfields must equal something; and be seperated by=semicolons"

def description(title)
    return "<p>" + title + " are used to inform workers in the field. This heavy duty outdoor rated tag is a required critical tool in safety, performance, and maintenance operations.</p>
    <p>Traditional OSHA-style signs, tags and labels are the most widely recognized design format in the industry.</p>"
end
def keywords(keytitle)
    return keytitle + "tags, safety, safety tags, OSHA, tag"
end

csv_file = File.read('C:\Users\ckimura\Downloads\RubyToCsv\test_alt.csv')
csv_text = CSV.parse(csv_file, :headers => true)

CSV.open('output.csv', 'w', write_headers: true, headers: headers) do |csv|
  CSV.foreach('C:\Users\ckimura\Downloads\RubyToCsv\test_alt.csv', headers:true) do |row|
    csv << [
        'Product',
        blank, 
        row['Product Name'], 
        row['Product Code/SKU'], 
        'P',
        row['Category'], 
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
        keywords(row['Product Name']), 
        row['Product Name'], 
        metakeywords, 
        metadescription,
        blank, 
        'Right', 
        'No', 
        productcustomfields, 
        row['Image'],
        blank,
        productimagedescription,
        'Yes',
        'No', 
        blank, 
        blank
    ]
    csv << [
        '  SKU',
        blank, 
        '[S]Material=vinyl,[S]Unit of Measure=Small', 
        row['Product Code/SKU'], 
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
        '[S]Material=vinyl,[S]Unit of Measure=Medium', 
        row['Product Code/SKU'], 
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
        row['Product Code/SKU'], 
        blank,
        blank, 
        blank, 
        '[ADD]10%', 
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
        row['Product Code/SKU'], 
        blank,
        blank, 
        blank, 
        '[ADD]10%', 
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