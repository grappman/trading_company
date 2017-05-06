require 'roo'

file_path = Rails.root.join("db","seeds", "seed.xlsx").to_path
xlsx = Roo::Excelx.new(file_path)
current_table = xlsx.sheet(0)

puts 'Upload seed data starting'
current_table.column(1).each_with_index do |product_name, i|
  next if i.zero?
  product = Product.find_or_create_by(name: product_name)
  break unless product.valid?
  puts "#{i+1}) product_name: #{product_name}"
  row = current_table.row(i+1)
  row.each_with_index do |cell, cell_index|
    next if cell_index.zero?
    product.sales.create(revenue: cell, trading_date: current_table.cell(1,cell_index + 1) )
  end
end