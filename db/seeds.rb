# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    #   t.integer :artist_id
      
    #   #Artwork detail
    #   t.string :title
    #   t.string :price
    #   t.string :size
    #   t.string :genre
    #   t.string :year
    #   t.string :material
      
    #   #Artwork 설명
    #   t.text :content
      
    #   t.integer :like
    #   t.integer :view
    
    # Market.create(title: "", price: "1000000", size: "", genre: "", year: "", material: "",
    #             content: "", like: 0:, view :0 , artist_id: 1 )
    
    Genre.create(name:"풍경")
    Genre.create(name:"인물")
    Genre.create(name:"정물")
    Genre.create(name:"동물")
    Genre.create(name:"추상")
    Genre.create(name:"공간")
    Genre.create(name:"팝아트")
    Genre.create(name:"기타")

    