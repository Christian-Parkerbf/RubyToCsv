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

def description(title)
    return "<p>" + title + " are used to inform workers in the field. This heavy duty outdoor rated tag is a required critical tool in safety, performance, and maintenance operations.</p>
    <p>Traditional OSHA-style signs, tags and labels are the most widely recognized design format in the industry.</p>
    <br><ul><li>Cardstock: For temporary use in clean and dry conditions. Cardstock paper is smooth and easy to write on with pen, pencil or permanent marker.</li>
    <li>Tyvek: A perfect solution for any label or tagging needs where the application requires strength. Water resistant, tear resistant, and able to withstand exposure to harsh elements. Tyvek tags have little lint so they have been approved for use in sterile rooms. Writable with a pen or marker.</li>
    <li>15 pt. Vinyl: Waterproof, oil proof, and tear proof plastic material. Used for prolonged indoor and outdoor use in standard conditions and provides durability in dirty or greasy environments. Writable with sharpie.</li></ul><br>
    <p>For orders over 5,000 contact us for specialty pricing.</p>
    <p>Any custom orders including but not limited to changes in size, material, or wording, contact our office at 800-888-3676 or email us at (insert email here)</p>"
end
def keywords(keytitle)
    return keytitle + ", tags, safety, safety tags, OSHA, tag"
end

CSV.open('output.csv', 'w', write_headers: true, headers: headers) do |csv|
  CSV.foreach('C:\Users\ckimura\Downloads\RubyToCsv\Tags\cautiontags.csv', headers:true) do |row|
    csv << [
        'Product',
        blank,#always leave blank
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
        keywords(row['Product Name']),#keywords description
        row['Product Name'],
        metakeywords,
        metadescription,
        blank,
        blank,
        'Right',
        'No',
        blank,
        row['Image'],
        blank,#always leave blank
        row['Product Name'],#product image description
        'Yes',
        'No',
        blank,
        blank,
        '25'
    ]
    csv << [
        '  SKU',
        blank,
        smallCardDrop,
        skuCardstockSmall(row['Product Code/SKU']),
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
        skuCardstockSmall(row['Product Code/SKU']),
        blank,
        blank,
        blank,
        '[FIXED]25',
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
        blank,
        blank,
        blank,
        blank,
        blank
    ]
  end
end