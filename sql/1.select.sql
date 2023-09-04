-- Movie.objects.all()
SELECT * FROM movies_movie;

-- User.objects.all()
SELECT * FROM movies_user;

-- Movie.objects.all().order_by('-year')
SELECT * FROM movies_movie
ORDER BY year DESC;

-- 터미널에
-- for movie in Movie.objects.all().order_by('-year'):
--    ...:     print(movie.id, movie.title)