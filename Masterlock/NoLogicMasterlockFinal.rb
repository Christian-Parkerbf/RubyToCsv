require 'csv'

#Reminders about Excel will be commented like this.
#Important: In the csv you are READING insert a new column A (name it anything) 
#otherwise the first property (sometimes ProductCode) will not be picked up this is usually 
#an Octoparse specific thing but may be good practice moving forward.
#When exporting octoparse files you don't always want to remove duplicate files

headers = ['Item Type', 'Product ID', 'Product Name', 'Product Code/SKU', 'Product Type',
    'Category', 'Product Description', 'Price', 'Product Visible', 'Allow Purchases?', 'Product Availability',
    'Free Shipping', 'Product Weight', 'Product Width', 'Product Height', 'Product Depth',
    'Brand Name', 'Warranty', 'Product Condition', 'Show Product Condition?', 
    'Product Tax Class', 'Search Keywords', 'Page Title', 'Meta Keywords', 'Meta Description',
    'Product URL', 'Option Set', 'Option Set Align', 'Stop Processing Rules', 'Product Custom Fields',
    'Product Image File - 1', 'Product Image ID - 1', 'Product Image Description - 1', 
    'Product Image Is Thumbnail - 1', 'GPS Enabled', 'Date Added', 'Date Modified', 'Product Image File - 2', 'Product Image ID - 2', 'Product Image Description - 2', 
    'Product Image Is Thumbnail - 2', 'Product Image File - 3', 'Product Image ID - 3', 'Product Image Description - 3', 
    'Product Image Is Thumbnail - 3', 'Product Image File - 4', 'Product Image ID - 4', 'Product Image Description - 4', 
    'Product Image Is Thumbnail - 4', 'Product Image File - 5', 'Product Image ID - 5', 'Product Image Description - 5', 
    'Product Image Is Thumbnail - 5', 'Product Image File - 6', 'Product Image ID - 6', 'Product Image Description - 6', 
    'Product Image Is Thumbnail - 6']

blank = ''
description = ""
warranty = ""
keywords = ""
productavailability = "Ships directly from manufacturer"
metakeywords = ""
metadescription = ""
productimagedescription = ""
productcustomfields = ""

def category(cat1, cat2, cat3)
    return 'Masterlock/' + cat1.to_s + '/' + cat2.to_s + '/' + cat3.to_s
end
def description(desc1, desc2, infodesc, warrantydesc)
    return "<p>" + desc1 + "</p> " + 
    "<p>" + desc2 + "</p> " + 
    '<p> Additional Information: </p><ul><li><a href="' + infodesc.to_s + '" target="_blank">' + infodesc.to_s + '</a></li>' +
    '<li> <a href="' + warrantydesc.to_s + '" target="_blank">' + warrantydesc.to_s + '</a></li></ul>'
end
def keywords(keytitle)
    return keytitle + ", hazard, placard, hazard placard, OSHA, hazmat, hazardous materials, hazardous class"
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
    #Go to Custom Fields column in Output.csv find and replace ":" with "="
    #Easy to overlook since at first glance Custom Fields looks like it is empty
end

csv_file = File.read('C:\Users\ckimura\Downloads\RubyToCsv\Masterlock\MasterlockLockoutTagout V3 Personal.csv')
csv_text = CSV.parse(csv_file, :headers => true)

CSV.open('C:\Users\ckimura\Downloads\RubyToCsv\Masterlock\output.csv', 'w', write_headers: true, headers: headers) do |csv|
  CSV.foreach('C:\Users\ckimura\Downloads\RubyToCsv\Masterlock\MasterlockLockoutTagout V3 Personal.csv', headers:true) do |row|
    csv << [
        'Product',
        blank, #always leave blank
        row['Title'], 
        row['ProductCode'], 
        'P',
        category(row['Category1'], row['Category2'], row['Category3']), 
        description(row['Description1'], row['Description2'], row['InstructionsOrOther'], row['Warranty']), 
        row['Price'], 
        'Yes', 
        'Yes',
        productavailability,
        'No', 
        blank, 
        blank, 
        blank, 
        blank,
        'Parker', 
        row["Warranty"], 
        'New', 
        'No', 
        'Default Tax Class', 
        keywords(row['Title']), #keywords description
        row['PageTitle'], 
        metakeywords, 
        metadescription,
        blank, #product url leave blank for now
        blank, 
        'Right', 
        'No', 
        productcustomfields(row["CustomField1"], row["CustomField2"], row["CustomField3"], row["CustomField4"], row["CustomField5"], row["CustomField6"], row["CustomField7"], row["CustomField8"], row["CustomField9"]),
        row['ImageURL1'], #For masterlock: go into Output.csv and replace "375" with "orig". Do this on every image url column
        blank, #always leave blank
        row['Title'], #Product Image Description
        'Yes', #Yes on the first and no on subsequent images (usually)
        'No', 
        blank, 
        blank,
        row['ImageURL2'],
        blank, #always leave blank
        row['Title'],
        'No',
        row['ImageURL3'],
        blank, #always leave blank
        row['Title'], 
        'No',
        row['ImageURL4'],
        blank, #always leave blank
        row['Title'], 
        'No',
        row['ImageURL5'],
        blank, #always leave blank
        row['Title'], 
        'No',
        row['ImageURL6'],
        blank, #always leave blank
        row['Title'], 
        'No'
    ]
  end
end