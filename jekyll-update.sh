IMAGE_NAME=chriscooper/jekyll-github-pages

docker run --rm -v `pwd`:/site:Z -it $IMAGE_NAME bundle update
