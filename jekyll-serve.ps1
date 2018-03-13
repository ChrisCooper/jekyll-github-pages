$IMAGE_NAME = 'chriscooper/jekyll-github-pages'

$SCRIPT_FULL_PATH = $MyInvocation.MyCommand.Path
$SCRIPT_DIRECTORY = (get-item $SCRIPT_FULL_PATH ).Directory.FullName
$PROJECT_DIR = $SCRIPT_DIRECTORY.Replace("\", "/")
Write-Output "Project directory is $PROJECT_DIR"

docker run --rm -v ${PROJECT_DIR}:/site:Z -it -p 4000:4000 $IMAGE_NAME bundle exec jekyll serve --host 0.0.0.0 --watch --verbose
