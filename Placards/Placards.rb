require 'csv'

headers = ['Item Type', 'Product ID', 'Product Name', 'Product Code/SKU', 'Product Type',
        'Category', 'Product Description', 'Price', 'Product Visible', 'Allow Purchases?',
        'Free Shipping', 'Product Weight', 'Product Width', 'Product Height', 'Product Depth',
        'Brand Name', 'Product Warranty', 'Product Condition', 'Show Product Condition?', 
        'Product Tax Class', 'Search Keywords', 'Page Title', 'Meta Keywords', 'Meta Description',
        'Product URL', 'Option Set', 'Option Set Align', 'Stop Processing Rules', 'Product Custom Fields',
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

def description(title, descriptiontable)
    return "<p>" + title + " are used to inform workers in the field. This heavy duty outdoor rated tag is a required critical tool in safety, performance, and maintenance operations.</p>
    <p>Traditional OSHA-style signs, tags and labels are the most widely recognized design format in the industry.</p>" + descriptiontable
end
def keywords(keytitle)
    return keytitle + ", hazard, placard, hazard placard, OSHA, hazmat, hazardous materials, hazardous class"
end
def SKUNumber25(skucode)
    return skucode + "-V1"
end
def hazClassName(abc, category)
    #abc = Alphabet in the csv and category (in this instance) = Single Category
    return "Hazard Class " + abc + " " + category + " Placards"
end

CSV.open('output.csv', 'w', write_headers: true, headers: headers) do |csv|
  CSV.foreach('C:\Users\ckimura\Downloads\RubyToCsv\Placards\HazardPlacards1-1.csv', headers:true) do |row|
    csv << [
        'Product',
        blank, #always leave blank
        row['Product Name'],
        row['Product Code/SKU'],
        'P',
        row['Category'],
        description(row['Product Name'], row['Description Table']),
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
        blank,
        blank
    ]
  end
end