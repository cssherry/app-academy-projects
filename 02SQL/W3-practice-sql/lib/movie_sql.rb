require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# List the films in which 'Chuck Norris' has appeared; order by movie
# title.
def bearded_films
  MovieDatabase.execute(<<-SQL)
    SELECT
      movie.title
    FROM
      actor
    JOIN
      movie ON movie.id = casting.movieid
    JOIN
      casting ON actor.id = casting.actorid
    WHERE
      actor.name = 'Chuck Norris'
    ORDER BY
      movie.title
  SQL
end

# Obtain the cast list for the movie "Zombies of the Stratosphere";
# order by the actor's name.
def zombie_cast
  MovieDatabase.execute(<<-SQL)
  SELECT
    actor.name
  FROM
    movie
  JOIN
    casting ON casting.movieid = movie.id
  JOIN
    actor ON casting.actorid = actor.id
  WHERE
    movie.title = 'Zombies of the Stratosphere'
  ORDER BY
    actor.name
  SQL
end

# Which were the busiest years for 'Danny DeVito'? Show the year and
# the number of movies he made each year for any year in which he made
# >2 movies. Order by year. Note the 'V' is capitalized.
def biggest_years_for_little_danny
  MovieDatabase.execute(<<-SQL)
  SELECT
    movie.yr, COUNT(*) AS count
  FROM
    casting
  JOIN
    actor ON casting.actorid = actor.id
  JOIN
    movie ON casting.movieid = movie.id
  WHERE
   actor.name = 'Danny DeVito'
  GROUP BY
    movie.yr
  HAVING
    COUNT(casting.movieid) > 2
  SQL
end

# List the films where 'Nicolas Cage' has appeared, but not in the
# star role. Order by movie title.
def more_cage_please
  MovieDatabase.execute(<<-SQL)
  SELECT
    movie.title
  FROM
    movie
  JOIN
    casting ON movie.id = casting.movieid
  JOIN
    actor ON actor.id = casting.actorid
  WHERE
    actor.name = "Nicolas Cage" AND casting.ord > 1
  ORDER BY
    movie.title
  SQL
end

# List the films together with the leading star for all 1908
# films. Order by movie title.
def who_is_florence_lawrence
  MovieDatabase.execute(<<-SQL)
    SELECT
      movie.title, actor.name
    FROM
      actor
    JOIN
      casting ON casting.actorid = actor.id
    JOIN
      movie ON movie.id = casting.movieid
    WHERE
      casting.ord = 1 AND movie.yr = 1908
    ORDER BY
      movie.title
  SQL
end

# Obtain a list in alphabetical order of actors who've had exactly 20
# starring roles. Order by actor name.
def twenty_roles
  MovieDatabase.execute(<<-SQL)
  SELECT
    actor.name
  FROM
    actor
  JOIN
    casting ON actor.id = casting.actorid
  JOIN
    movie ON casting.movieid = movie.id
  WHERE
    casting.ord = 1
  GROUP BY
    actor.name
  HAVING
    COUNT(*) = 20
  ORDER BY
    actor.name
  SQL
end

# List the film title and the leading actor for all of the films
# 'Chris Farley' played in.
def chris_is_missed
  MovieDatabase.execute(<<-SQL)
    SELECT
      m1.title, a1.name
    FROM
      movie m1
    JOIN
      casting c1 ON m1.id = c1.movieid
    JOIN
      actor a1 ON a1.id = c1.actorid
    WHERE
    'Chris Farley'  IN (SELECT
        a2.name
      FROM
        movie m2
      JOIN
        casting c2 ON m2.id = c2.movieid
      JOIN
        actor a2 ON a2.id = c2.actorid
      WHERE
        m2.title = m1.title
    ) AND c1.ord = 1
  SQL
end
