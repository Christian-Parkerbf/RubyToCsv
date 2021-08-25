require 'csv'

header = ['Item Number', 'Item Name', 'Item Price', 'Image URL', 'Description']
description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."

csv_file = File.read("input.csv")
csv_text = CSV.parse(csv_file, :headers => true)

CSV.open('output.csv', 'w', write_headers: true, headers: header) do |csv|
  CSV.foreach('input.csv', headers:true) do |row|
    csv << [row['partno'], row['Description'], row['Price'], row['Image'], "Fixed text of something", description]
    csv << ["skus"]
    csv << ["skus"]
    csv << ["skus"]
  end
end