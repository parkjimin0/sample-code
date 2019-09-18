# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
Beehive.destroy_all
Cell.destroy_all
CellType.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!("beehives")
ActiveRecord::Base.connection.reset_pk_sequence!("cells")
ActiveRecord::Base.connection.reset_pk_sequence!("cell_types")

hives_list = [
    "Jimin's Hive",
    "Rob's Hive",
    "Lesley's Hive", 
    "Whitney's Hive",
    "Anthony's Hive", 
]

cell_types_list = [
    "empty",
    "honey",
    "pollen",
    "egg",
    "larvae",
    "pupa"
]

cell_types_list.each do |name|
    CellType.create( name: name )
end

hives_list.each do |name|
    Beehive.create( name: name )
end


Beehive.all.each do |hive| 
    hive.cells.create(:name => "Empty Cell", :cell_type_id => 1 )
    hive.cells.create(:name => "Food", :cell_type_id => 2 )
    hive.cells.create(:name => "Pollen Room", :cell_type_id => 3 )
    hive.cells.create(:name => "Egg Bee", :cell_type_id => 4 )
    hive.cells.create(:name => "Larvae Bee", :cell_type_id => 5 )
    hive.cells.create(:name => "Baby Bee", :cell_type_id => 6 )
end