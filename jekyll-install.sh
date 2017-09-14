IMAGE_NAME=chriscooper/jekyll-github-pages

docker build -t $IMAGE_NAME .
docker run --rm -v `pwd`:/site:Z -it $IMAGE_NAME bundle install
