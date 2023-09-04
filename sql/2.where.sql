-- -- User.objects.filter(age=41) => orm에 작성
-- SELECT * FROM movies_user
-- WHERE age=41;

-- -- Movie.objects.filter(year__gt=2000)
-- -- lookup 사용 / 부등호를 사용할 수 없어서
-- SELECT * FROM movies_movie
-- WHERE year > 2000;

-- -- Movie.objects.filter(year__gt=2000, year__lt=2010)
-- SELECT * FROM movies_movie
-- WHERE year > 2000 AND year < 2010;

-- -- Movie.objects.filter( Q(year__lt=2000)| Q(year__gt=2010) )
-- -- or을 사용하기 위해서는 Q() 함수를 사용해야 함
-- SELECT * FROM movies_movie
-- WHERE year < 2000 OR year > 2010;

-- -- User.objects.exclude(age__gt=30)
-- SELECT * FROM movies_user
-- WHERE NOT age > 30;

-- -- Movie.objects.aggregate(Min('year'))
-- SELECT MIN(YEAR) FROM movies_movie;

-- -- Movie.objects.aggregate(Max('year'))
-- SELECT MAX(YEAR) FROM movies_movie;

-- -- Score.objects.filter(movie_id=1).aggregate(Min('value'), Max('value'))
-- SELECT MAX(value), MIN(value)
-- FROM movies_score
-- WHERE movie_id=1;

-- -- Movie.objects.count()
-- SELECT COUNT(*) FROM movies_movie;

-- -- Movie.objects.filter(year__gt=2000).count()
-- SELECT COUNT(*) 
-- FROM movies_movie
-- WHERE year > 2000;

-- -- User.objects.values('country').distinct().count()
-- SELECT COUNT(DISTINCT country)
-- FROM movies_user;

-- -- Movie.objects.aggregate(Sum('year'))
-- SELECT SUM(year) FROM movies_movie;

-- -- Score.objects.filter(movie_id=10).aggregate(Sum('value'))
-- SELECT SUM(value) 
-- FROM movies_score
-- WHERE movie_id=10;

-- -- Movie.objects.aggregate(Avg('year'))
-- SELECT AVG(year) FROM movies_movie;

-- -- Score.objects.filter(movie_id=10).aggregate(Avg('value'))
-- SELECT AVG(value) 
-- FROM movies_score
-- WHERE movie_id=10;

-- -- avg = Score.objects.aggregate(Avg('value'))
-- -- avg
-- -- Score.objects.filter(value__gt=avg['value__avg'])
-- SELECT * FROM movies_score
-- WHERE value > (SELECT AVG(value) FROM movies_score)

-- -- Movie.objects.filter(title__contains='the')
-- SELECT * FROM movies_movie
-- WHERE title LIKE '%the%';

-- -- Movie.objects.filter(title__startswith='the')
-- SELECT * FROM movies_movie
-- WHERE title LIKE 'the%';

-- -- Movie.objects.filter(title__endswith='on.')
-- SELECT * FROM movies_movie
-- WHERE title LIKE '%on.';


-- SELECT * FROM movies_movie
-- WHERE title LIKE '%g__d%';

-- -- Movie.objects.filter(year__in=[2000,2001,2002])
-- SELECT * FROM movies_movie
-- WHERE year IN (2000, 2001, 2002);

-- -- User.objects.filter(age__range=[20, 30])
-- SELECT * FROM movies_user
-- WHERE age BETWEEN 20 AND 30;



-- -- Actor.objects.all()
-- -- for actor in Actor.objects.all()[:10]:
-- --     ...:     print(actor.id, actor.age)

-- -- actors = Actor.objects.filter(id__range=[1,10])
-- -- for actor in actors:
-- --     ...:     actor.age = 50
-- --     ...:     actor.save()
-- UPDATE movies_actor
-- SET age=100
-- WHERE id BETWEEN 1 AND 10;

-- SELECT * FROM movies_actor;



