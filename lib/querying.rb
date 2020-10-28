def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT Books.title, Books.year
  FROM Books
  INNER JOIN Series
  ON Series.id = Books.series_id
  WHERE Series.id = 1"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT Characters.name, Characters.motto
  FROM Characters
  ORDER BY LENGTH(motto) DESC
  LIMIT 1"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(Characters.species)
  FROM Characters
  GROUP BY species
  ORDER BY COUNT(species) DESC
  LIMIT 1"
end #i don't understand why this worked and the same thing without group by species returned a value i don't think existed?

def select_name_and_series_subgenres_of_authors
  "SELECT Authors.name, Subgenres.name
  FROM Authors
  INNER JOIN Subgenres, Series
  ON Authors.id = Series.author_id WHERE Series.subgenre_id = Subgenres.id"
end

def select_series_title_with_most_human_characters
  "SELECT Series.title
  FROM Series
  LEFT OUTER JOIN character_books, books, characters
  ON Series.id = Books.series_id WHERE Books.id = character_books.book_id
  GROUP BY Characters.species HAVING Characters.species = 'human'
  LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT Characters.name, COUNT(character_books.book_id)
  FROM Characters
  LEFT OUTER JOIN character_books
  ON Characters.id = character_books.character_id
  GROUP BY Characters.name
  ORDER BY COUNT(character_books.book_id) DESC, Characters.name ASC"
end