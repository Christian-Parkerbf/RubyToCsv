require 'csv'
require 'set'

header = ['Item Number', 'Item Name', 'Variant 1', 'Item Price', 'Image URL', 'Description']
description = "Description Example."

parent_id_last = ""
parent_id_list = []
variant_1 = Set.new
variant_2 = Set.new
variant_3 = Set.new
variant_combo = Set.new
variant_all_combos = Array.new
### Sets vs Arrays. In this example, a set is made up of unique attributes. There are no duplicates.

CSV.open('output.csv', 'w', write_headers: true, headers: header) do |csv|
  CSV.foreach('input.csv', headers:true) do |row|

    ### Check if current row is a different product/parent item. 
    ### If yes, generate all missing skus of previous item and reset misc variant trackers.
    if row['parent_id'].to_s != parent_id_last
      variant_1plus2 = variant_1.to_a.product(variant_2.to_a).map{ |group| group.join(" ") }
      variant_all_combos << variant_1plus2.to_a.product(variant_3.to_a).map{ |group| group.join(" ") }
      variants_leftover = variant_all_combos[0] - variant_combo.to_a
      variants_leftover.each do |variant|
        csv << ["   sku", "_" + parent_id_last + "_" + rand.to_s[2..6], variant]
      end
      variant_1.clear
      variant_2.clear
      variant_3.clear
      variant_combo.clear
      variant_all_combos.clear
    end

    if row['parent_id'].nil?  
      csv << [row['partno'], row['Description'], "", row['Price'], row['Image'], "Fixed text of something", description]
      parent_id_last = row['parent_id']
    elsif !parent_id_list.include? row['parent_id']
      csv << [row['parent_id'], row['Description'], "", row['Price'], row['Image'], "Fixed text of something", description]
      csv << ["   sku", row['partno'], row['variant_1'] + " " + row['variant_2'] + " " + row['variant_3']]
      
      ### Update variant trackers.
      parent_id_list << row['parent_id']
      variant_1 << row['variant_1']
      variant_2 << row['variant_2']
      variant_3 << row['variant_3']
      variant_combo << row['variant_1'] + " " + row['variant_2'] + " " + row['variant_3']
      parent_id_last = row['parent_id']
    else
      csv << ["   sku", row['partno'], row['variant_1'] + " " + row['variant_2'] + " " + row['variant_3']]
      
      ### Update variant trackers.
      variant_1 << row['variant_1']
      variant_2 << row['variant_2']
      variant_3 << row['variant_3']
      variant_combo << row['variant_1'] + " " + row['variant_2'] + " " + row['variant_3']
      parent_id_last = row['parent_id']
    end
  end

  ### Generate all missing skus one last time, if the last item is a parent/child sku.
  variant_1plus2 = variant_1.to_a.product(variant_2.to_a).map{ |group| group.join(" ") }
  variant_all_combos << variant_1plus2.to_a.product(variant_3.to_a).map{ |group| group.join(" ") }
  variants_leftover = variant_all_combos[0] - variant_combo.to_a
  variants_leftover.each do |variant|
    csv << ["   sku", "_" + parent_id_last + "_" + rand.to_s[2..6], variant]
  end
end