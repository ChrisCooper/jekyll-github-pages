IMAGE_NAME=chriscooper/jekyll-github-pages

docker run --rm -v `pwd`:/site:Z -it -p 4000:4000 $IMAGE_NAME bundle exec jekyll serve --host 0.0.0.0 --watch --verbose
