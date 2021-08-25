require 'csv'
require 'set'

headers = ['Item Type', 'Product ID', 'Product Name', 'Product Code/SKU', 'Product Type',
    'Category', 'Product Description', 'Price', 'Product Visible', 'Allow Purchases?', 
    'Product Availability', 'Free Shipping', 'Product Weight', 'Product Width', 
    'Product Height', 'Product Depth', 'Brand Name', 'Warranty', 'Product Condition', 
    'Show Product Condition?', 'Product Tax Class', 'Search Keywords', 'Page Title', 
    'Meta Keywords', 'Meta Description', 'Product URL', 'Option Set', 'Option Set Align', 
    'Stop Processing Rules', 'Product Custom Fields', 'Product Image File - 1', 
    'Product Image ID - 1', 'Product Image Description - 1', 'Product Image Is Thumbnail - 1', 
    'GPS Enabled', 'Date Added', 'Date Modified', 'Product Image File - 2', 
    'Product Image ID - 2', 'Product Image Description - 2', 'Product Image Is Thumbnail - 2', 
    'Product Image File - 3', 'Product Image ID - 3', 'Product Image Description - 3', 
    'Product Image Is Thumbnail - 3', 'Product Image File - 4', 'Product Image ID - 4', 
    'Product Image Description - 4', 'Product Image Is Thumbnail - 4', 'Product Image File - 5', 
    'Product Image ID - 5', 'Product Image Description - 5', 'Product Image Is Thumbnail - 5', 
    'Product Image File - 6', 'Product Image ID - 6', 'Product Image Description - 6', 
    'Product Image Is Thumbnail - 6']

blank=""

def skuName(var1, var2, var3, var4)
    return "[S]" + var1.to_s + ", [S]" + var2.to_s + ", [S]" + var3.to_s + ", [S]" + var4.to_s
end
def category(cat1, cat2, cat3)
    return "Masterlock/" + cat1.to_s + '/' + cat2.to_s + '/' + cat3.to_s
end
def description(desc1, desc2)
    "<p>" + desc1 + "</p> <br> " + desc2
end
def productcustomfields(custom1, productManual1, productManual2, productManual3, productManual4, productManual5, compliance1, relInfo1, relInfo2, relInfo3, relInfo4, onlSup1, onlSup2, onlSup3)
    return custom1.to_s + "; " +
    'Product Manual = <a href="' + productManual1.to_s + '" target="_blank">' + productManual1.to_s + "</a> <br>; " +
    'Product Manual = <a href="' + productManual2.to_s + '" target="_blank">' + productManual2.to_s + "</a> <br>; " +
    'Product Manual = <a href="' + productManual3.to_s + '" target="_blank">' + productManual3.to_s + "</a> <br>; " +
    'Product Manual = <a href="' + productManual4.to_s + '" target="_blank">' + productManual4.to_s + "</a> <br>; " +
    'Product Manual = <a href="' + productManual5.to_s + '" target="_blank">' + productManual5.to_s + "</a> <br>; " +
    'Compliance Warning = <a href="' + compliance1.to_s + '" target="_blank">' + compliance1.to_s + "</a> <br>; " +
    'Related Information = <a href="' + relInfo1.to_s + '" target="_blank">' + relInfo1.to_s + "</a> <br>; " +
    'Related Information = <a href="' + relInfo2.to_s + '" target="_blank">' + relInfo2.to_s + "</a> <br>; " +
    'Related Information = <a href="' + relInfo3.to_s + '" target="_blank">' + relInfo3.to_s + "</a> <br>; " +
    'Related Information = <a href="' + relInfo4.to_s + '" target="_blank">' + relInfo4.to_s + "</a> <br>; " +
    'Online Support = <a href="' + onlSup1.to_s + '" target="_blank">' + onlSup1.to_s + "</a> <br>; " +
    'Online Support = <a href="' + onlSup2.to_s + '" target="_blank">' + onlSup2.to_s + "</a> <br>; " +
    'Online Support = <a href="' + onlSup3.to_s + '" target="_blank">' + onlSup3.to_s + "</a> <br>; "
end
def rulePrice(newprice)
    return "[FIXED]" + newprice.to_s
end

parent_id_last = ""
parent_id_list = []
variant_1 = Set.new
variant_2 = Set.new
variant_3 = Set.new
variant_combo = Set.new
variant_all_combos = Array.new

CSV.open('output.csv', 'w', write_headers: true, headers: headers) do |csv|
  CSV.foreach('C:\Users\ckimura\Downloads\RubyToCsv\Masterlock\masterlocktest2.csv', headers:true) do |row|

    if row['Parent'].to_s != parent_id_last
        variant_1plus2 = variant_1.to_a.product(variant_2.to_a).map{ |group| group.join(" ") }
        variant_all_combos << variant_1plus2.to_a.product(variant_3.to_a).map{ |group| group.join(" ") }
        variants_leftover = variant_all_combos[0] - variant_combo.to_a
        variants_leftover.each do |variant|

        csv << ["   sku", blank, variant, " _" + parent_id_last + "_" + rand.to_s[2..6]]
       
        end
        variant_1.clear
        variant_2.clear
        variant_3.clear
        variant_combo.clear
        variant_all_combos.clear
    end

    if row['Parent'].nil?
        csv << [
            'Product',
            blank, #always leave blank
            row['PageTitle'], 
            row['ProductCode'], 
            'P',
            category(row['Category1'], row['Category2'], row['Category3']), 
            description(row['Description1'], row['Description2HTML']), #description
            row['Price'], 
            'Yes', 
            row['Allow Purchases'],
            blank,
            'No', 
            blank, 
            blank, 
            blank, 
            blank,
            'MasterLock', 
            row["Warranty"], 
            'New', 
            'No', 
            'Default Tax Class', 
            blank, #keywords description
            row['PageTitle'], 
            blank, 
            blank,
            blank, #product url leave blank for now
            blank, 
            'Right', 
            'No', 
            productcustomfields(row["LongListCustomFields"], row["ProductManual1"], row["ProductManual2"], row["ProductManual3"], row["ProductManual4"], row["ProductManual5"], row['ComplianceList1'], row['RelatedInformation1'], row['RelatedInformation2'], row['RelatedInformation3'], row['RelatedInformation4'], row['OnlineSupport1'], row['OnlineSupport2'], row['OnlineSupport3']),
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
        
        parent_id_last = row['Parent']
    
    elsif !parent_id_list.include? row['Parent']
        csv << [
            'Product',
            blank,
            row['PageTitle'], 
            row['Parent'], 
            'P',
            category(row['Category1'], row['Category2'], row['Category3']), 
            description(row['Description1'], row['Description2HTML']), #description
            row['Price'], 
            'Yes', 
            row['Allow Purchases'],
            blank,
            'No', 
            blank, 
            blank, 
            blank, 
            blank,
            'MasterLock', 
            row["Warranty"], 
            'New', 
            'No', 
            'Default Tax Class', 
            blank, #keywords description
            row['PageTitle'], 
            blank, 
            blank,
            blank, #product url leave blank for now
            blank, 
            'Right', 
            'No', 
            productcustomfields(row["LongListCustomFields"], row["ProductManual1"], row["ProductManual2"], row["ProductManual3"], row["ProductManual4"], row["ProductManual5"], row['ComplianceList1'], row['RelatedInformation1'], row['RelatedInformation2'], row['RelatedInformation3'], row['RelatedInformation4'], row['OnlineSupport1'], row['OnlineSupport2'], row['OnlineSupport3']),
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

        csv << ["   SKU", blank, skuName(row['Variant1'], row['Variant2'], row['Variant3'], row['Variant4']), 
        row['ProductCode'], blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
        blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
        blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
        blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
        blank, blank, blank, blank, blank
        ]

        #in output.csv replace all "$" in price with ""
        csv << ["   Rule", blank, row['PageTitle'], row['ProductCode'], blank, blank, blank, 
        rulePrice(row['Price']), "Y", row['Allow Purchases'], blank, blank, blank, blank, 
        blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
        blank, blank, "N", blank, row["ImageURL1"], blank, row['Title'], "No", blank, blank, 
        blank, row["ImageURL2"], blank, row['Title'], "No", row["ImageURL3"], blank, 
        row['Title'], "No", row["ImageURL4"], blank, row['Title'], "No", row["ImageURL5"], 
        blank, row['Title'], "No", row["ImageURL6"], blank, row['Title'], "No"
        ]

        ### Update variant trackers.
        parent_id_list << row['Parent']
        variant_1 << row['Variant1']
        variant_2 << row['Variant2']
        variant_3 << row['Variant3']
        variant_combo << row['Variant1'].to_s + " " + row['Variant2'].to_s + " " + row['Variant3'].to_s
        parent_id_last = row['Parent']

    else
        csv << ["   SKU", blank, skuName(row['Variant1'], row['Variant2'], row['Variant3'], row['Variant4']), 
        row['ProductCode'], blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
        blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
        blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
        blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
        blank, blank, blank, blank, blank
        ]

        #in output.csv replace all "$" in price with ""
        csv << ["   Rule", blank, row['PageTitle'], row['ProductCode'], blank, blank, blank, 
        rulePrice(row['Price']), "Y", row['Allow Purchases'], blank, blank, blank, blank, 
        blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, blank, 
        blank, blank, "N", blank, row["ImageURL1"], blank, row['Title'], "No", blank, blank, 
        blank, row["ImageURL2"], blank, row['Title'], "No", row["ImageURL3"], blank, 
        row['Title'], "No", row["ImageURL4"], blank, row['Title'], "No", row["ImageURL5"], 
        blank, row['Title'], "No", row["ImageURL6"], blank, row['Title'], "No"
        ]

        ### Update variant trackers.
        parent_id_list << row['Parent']
        variant_1 << row['Variant1']
        variant_2 << row['Variant2']
        variant_3 << row['Variant3']
        variant_combo << row['Variant1'].to_s + " " + row['Variant2'].to_s + " " + row['Variant3'].to_s
        parent_id_last = row['Parent']

    end
  end

    ### Generate all missing skus one last time, if the last item is a parent/child sku.
    variant_1plus2 = variant_1.to_a.product(variant_2.to_a).map{ |group| group.join(" ") }
    variant_all_combos << variant_1plus2.to_a.product(variant_3.to_a).map{ |group| group.join(" ") }
    variants_leftover = variant_all_combos[0] - variant_combo.to_a
    variants_leftover.each do |row|
    csv << ["   sku", blank, skuName(row['Variant1'], row['Variant2'], row['Variant3'], row['Variant4']), 
    " _" + parent_id_last + "_" + rand.to_s[2..6]]

    csv << ["   Rule", blank, row['PageTitle'], row['ProductCode'], blank, blank, blank, 
    rulePrice(row['Price']), 'Y', "N"]
    end
end