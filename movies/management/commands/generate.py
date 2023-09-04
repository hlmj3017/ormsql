from django.core.management.base import BaseCommand
from movies.models import Actor, Movie, Category, Score, User
from faker import Faker

# 모델링 작업을 통해서 데이터를 랜덤으로 넣어주는 작업
class Command(BaseCommand):

    def handle(self, *args, **options):
        fake = Faker()
        Faker.seed(0)

        categories = [
            'drama',
            'comedy',
            'romance',
            'thriller',
            'action',
            'documentary',
            'horror',
            'animation',
        ]

        # create categories
        for i in range(8):
            Category.objects.create(
                name=categories[i]
            )
            
        # create actors
        for i in range(50):
            Actor.objects.create(
                name=fake.name(),
                age=fake.random_int(min=10, max=50)
            )

        # create movies
        for i in range(100):
            movie = Movie.objects.create(
                title=fake.sentence(),
                year=fake.year(),
            )

            # random choice 3 actors and 2 categories
            actors = Actor.objects.order_by('?')[:3]      # 정렬을 따로 하지 않고 무작위로 뽑아달라는 뜻 => 앞에서 3명
            categories = Category.objects.order_by('?')[:2]     # 섞은 후 => 앞에서 2명

            # add actors and categories to movie
            movie.actors.add(*actors)           # 쿼리 형태를 하나하나 풀어서 넣겠다는 뜻 unpacking
            movie.categories.add(*categories)


        # create users
        for i in range(50):
            User.objects.create(
                name=fake.name(),
                country=fake.country(),
                email=fake.free_email(),
                age=fake.random_int(min=10, max=50)
            )


        # create scores
        for i in range(1000):
            movie = Movie.objects.order_by('?').first()
            user = User.objects.order_by('?').first()

            Score.objects.create(
                content=fake.sentence(),
                value=fake.random_int(min=1, max=5),
                movie=movie,
                user=user,
            )