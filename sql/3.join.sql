-- -- 1번 유저가 작성한 모든 점수(Score)
-- SELECT * FROM movies_user

-- JOIN movies_score ON movies_user.id = movies_score.user_id
-- WHERE movies_user.id = 1;

-- Score.objects.filter(user_id=1)
--  User.objects.get(id=1).score_set.all()
-- => 위의 두개 각각 같은 결과임



-- -- 1번 영화의 카테고리
-- SELECT * FROM movies_movie
-- JOIN movies_category_movies ON movies_movie.id = movies_category_movies.movie_id
-- JOIN movies_category ON movies_category_movies.category_id = movies_category.id
-- WHERE movies_movie.id=1;

-- Movie.objects.get(id=1).categories.all()
-- => M:N은 두개 이상의 중간 모델을 거쳐야 함



-- -- 1번 유저가 작성한 모든 점수의 평균
-- SELECT AVG(value) FROM movies_user
-- JOIN movies_score ON movies_user.id = movies_score.user_id
-- WHERE movies_user.id = 1;

-- User.objects.get(id=1).score_set.all().aggregate(Avg('value'))
-- Score.objects.filter(user_id=1).aggregate(Avg('value'))


-- -- drama 카테고리에 속한 모든 영화
-- SELECT * FROM movies_movie
-- JOIN movies_category_movies on movies_movie.id = movies_category_movies.movie_id
-- JOIN movies_category ON movies_category.id = movies_category_movies.category_id
-- WHERE movies_category.name = 'drama';

-- Category.objects.get(name='drama').movies.all()


-- -- group by
-- SELECT * FROM movies_user
-- GROUP BY country;

-- User.objects.values('country').annotate(Count('id'))



-- 나라별 점수 평균
SELECT country, COUNT(*), AVG(value) FROM movies_user
JOIN movies_score ON movies_user.id = movies_score.user_id
GROUP BY country;

-- User.objects.values('country').annotate(Count('id'), Avg('score__value'))



