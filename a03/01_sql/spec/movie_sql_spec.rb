# -*- coding: utf-8 -*-
require 'rspec'
require 'movie_sql'

describe do
  it "1. List Casablanca cast by last name" do
    expect(casablanca_cast).to eq([
      { "name" => "Curt Bois" },
      { "name" => "Dooley Wilson" },
      { "name" => "Georges Renavent" },
      { "name" => "Hans Twardowski" },
      { "name" => "Helmut Dantine" },
      { "name" => "High Sierra" },
      { "name" => "Ilka Grünig" },
      { "name" => "Intermezzo" },
      { "name" => "Jean Del Val" },
      { "name" => "John Qualen" },
      { "name" => "Joy Page" },
      { "name" => "Key Largo" },
      { "name" => "Leo White" },
      { "name" => "Leon Belasco" },
      { "name" => "Leonid Kinskey" },
      { "name" => "Louis V. Arco" },
      { "name" => "Ludwig Stössel" },
      { "name" => "Madeleine LeBeau" },
      { "name" => "Norma Varden" },
      { "name" => "Notorious" },
      { "name" => "Paul Henreid" },
      { "name" => "Peter Lorre" },
      { "name" => "Richard Ryen" },
      { "name" => "Russian Revolution" },
      { "name" => "S. Z. Sakall" },
      { "name" => "The Cabinet of Dr. Caligari" },
      { "name" => "The Maltese Falcon" },
      { "name" => "To Have and Have Not" },
      { "name" => "Torben Meyer" },
      { "name" => "Trude Berliner" },
      { "name" => "William Edmunds" },
      { "name" => "Wolfgang Zilzer" }
    ])
  end

  it "2. List Harrison Ford films by movie title" do
    expect(harrison_ford_films).to eq([
      { "title" => "A Hundred and One Nights" },
      { "title" => "American Graffiti" },
      { "title" => "Apocalypse Now" },
      { "title" => "Dead Heat on a Merry-Go-Round" },
      { "title" => "Extraordinary Measures" },
      { "title" => "Firewall" },
      { "title" => "Force 10 From Navarone" },
      { "title" => "Hawthorne of the U.S.A." },
      { "title" => "Hollywood Homicide" },
      { "title" => "Indiana Jones and the Last Crusade" },
      { "title" => "Jimmy Hollywood" },
      { "title" => "More American Graffiti" },
      { "title" => "Morning Glory" },
      { "title" => "Presumed Innocent" },
      { "title" => "Regarding Henry" },
      { "title" => "Sabrina" },
      { "title" => "Sally of the Sawdust" },
      { "title" => "Shadows" },
      { "title" => "Six Days Seven Nights" },
      { "title" => "Smilin' Through" },
      { "title" => "Star Wars Episode IV: A New Hope" },
      { "title" => "Star Wars Episode V: The Empire Strikes Back" },
      { "title" => "Star Wars Episode VI: Return of the Jedi" },
      { "title" => "The Conversation" },
      { "title" => "The Devil's Own" },
      { "title" => "The Fugitive" },
      { "title" => "The Mosquito Coast" },
      { "title" => "The Star Wars Holiday Special" },
      { "title" => "What Lies Beneath" },
      { "title" => "Witness" }
    ])
  end

  it "3. List Harrison Ford supporting actor films by title" do
    expect(harrison_ford_supporting_actor_films).to eq([
      { "title" => "A Hundred and One Nights" },
      { "title" => "American Graffiti" },
      { "title" => "Apocalypse Now" },
      { "title" => "Dead Heat on a Merry-Go-Round" },
      { "title" => "Extraordinary Measures" },
      { "title" => "Force 10 From Navarone" },
      { "title" => "Hawthorne of the U.S.A." },
      { "title" => "Jimmy Hollywood" },
      { "title" => "More American Graffiti" },
      { "title" => "Morning Glory" },
      { "title" => "Sally of the Sawdust" },
      { "title" => "Shadows" },
      { "title" => "Smilin' Through" },
      { "title" => "Star Wars Episode IV: A New Hope" },
      { "title" => "Star Wars Episode V: The Empire Strikes Back" },
      { "title" => "Star Wars Episode VI: Return of the Jedi" },
      { "title" => "The Conversation" },
      { "title" => "The Star Wars Holiday Special" },
    ])
  end

  it "4. List 1962 leading stars by movie title" do
    expect(leading_star_for_1962_films).to eq([
      { "title" => "A Kind of Loving", "name" => "Alan Bates" },
      { "title" => "Barabbas", "name" => "Anthony Quinn" },
      { "title" => "Big and Little Wong Tin Bar", "name" => "Jackie Chan" },
      { "title" => "Billy Rose's Jumbo", "name" => "Doris Day" },
      { "title" => "Birdman of Alcatraz", "name" => "Burt Lancaster" },
      { "title" => "Boys' Night Out", "name" => "Kim Novak" },
      { "title" => "Cape Fear", "name" => "Gregory Peck" },
      { "title" => "Carry On Cruising", "name" => "Sid James" },
      { "title" => "Days of Wine and Roses", "name" => "Jack Lemmon" },
      { "title" => "Dr. No", "name" => "James Bond" },
      { "title" => "Gay Purr-ee", "name" => "Judy Garland" },
      { "title" => "Gypsy", "name" => "Rosalind Russell" },
      { "title" => "In Search of the Castaways", "name" => "Hayley Mills" },
      { "title" => "Jigsaw", "name" => "Jack Warner" },
      { "title" => "L'Eclisse", "name" => "Alain Delon" },
      { "title" => "La notte", "name" => "Marcello Mastroianni" },
      { "title" => "Life for Ruth", "name" => "Michael Craig" },
      { "title" => "Lolita", "name" => "James Mason" },
      { "title" => "Long Day's Journey into Night", "name" => "Katharine Hepburn" },
      { "title" => "Love at Twenty", "name" => "Jean-Pierre Léaud" },
      { "title" => "Lycanthropus", "name" => "Barbara Lass" },
      { "title" => "Mother Joan of the Angels", "name" => "Lucyna Winnicka" },
      { "title" => "Mutiny on the Bounty", "name" => "Marlon Brando" },
      { "title" => "Panic in Year Zero!", "name" => "Ray Milland" },
      { "title" => "Period of Adjustment", "name" => "Anthony Franciosa" },
      { "title" => "Pressure Point", "name" => "Bobby Darin" },
      { "title" => "Ride the High Country", "name" => "Randolph Scott" },
      { "title" => "State Fair", "name" => "Pat Boone" },
      { "title" => "Sundays and Cybele", "name" => "Hardy Krüger" },
      { "title" => "Term of Trial", "name" => "Laurence Olivier" },
      { "title" => "That Touch of Mink", "name" => "Cary Grant" },
      { "title" => "The 300 Spartans", "name" => "King Leonidas" },
      { "title" => "The Apartment", "name" => "Jack Lemmon" },
      { "title" => "The Counterfeit Traitor", "name" => "William Holden" },
      { "title" => "The Man Who Shot Liberty Valance", "name" => "John Wayne" },
      { "title" => "The Manchurian Candidate", "name" => "Frank Sinatra" },
      { "title" => "The Music Man", "name" => "Robert Preston" },
      { "title" => "The Phantom of the Opera", "name" => "Herbert Lom" },
      { "title" => "The Trial", "name" => "Anthony Perkins" },
      { "title" => "Through a Glass Darkly", "name" => "Harriet Andersson" },
      { "title" => "To Kill a Mockingbird", "name" => "Mary Badham" },
      { "title"=>"Village of Daughters", "name"=>"Yvonne Romain"},
      { "title" => "What Ever Happened to Baby Jane?", "name" => "Joan Crawford" },
      { "title" => "Who's Got the Action?", "name" => "Dean Martin" }
    ])
  end

  it "5. List years in which John Travolta made >2 films" do
    expect(busiest_john_travolta_years).to eq([
      { "yr" => 1998, "count" => 3 }
    ])
  end

  it "6. List the leading actor for all Julie Andrew films (by movie title)" do
    expect(julie_andrews_stars).to eq([
      { "title" => "10", "name" => "Dudley Moore" },
      { "title" => "Darling Lili", "name" => "Julie Andrews" },
      { "title" => "Despicable Me", "name" => "Steve Carell" },
      { "title" => "Relative Values", "name" => "Julie Andrews" },
      { "title" => "S.O.B.", "name" => "Julie Andrews" },
      { "title" => "Star!", "name" => "Julie Andrews" },
      { "title" => "The Americanization of Emily", "name" => "James Garner" },
      { "title" => "The Pink Panther Strikes Again", "name" => "Peter Sellers" },
      { "title" => "The Princess Diaries", "name" => "Anne Hathaway" },
      { "title" => "The Princess Diaries 2: Royal Engagement", "name" => "Anne Hathaway" },
      { "title" => "The Sound of Music", "name" => "Julie Andrews" },
      { "title" => "Thoroughly Modern Millie", "name" => "Julie Andrews" },
      { "title" => "Tooth Fairy", "name" => "Dwayne Johnson" },
      { "title" => "Torn Curtain", "name" => "Paul Newman" },
      { "title" => "Victor Victoria", "name" => "Julie Andrews" }
    ])
  end

  it "7. List actors with >= 30 starring roles (by name)" do
    expect(biggest_stars).to eq([
      { "name" => "John Wayne", "count" => 37 }
    ])
  end
end
