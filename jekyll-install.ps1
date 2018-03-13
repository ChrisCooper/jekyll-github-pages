$IMAGE_NAME = 'chriscooper/jekyll-github-pages'

$SCRIPT_FULL_PATH = $MyInvocation.MyCommand.Path
$SCRIPT_DIRECTORY = (get-item $SCRIPT_FULL_PATH ).Directory.FullName
$PROJECT_DIR = $SCRIPT_DIRECTORY.Replace("\", "/")
Write-Output "Project directory is $PROJECT_DIR"

docker build -t $IMAGE_NAME $PROJECT_DIR
docker run --rm -v ${PROJECT_DIR}:/site:Z -it $IMAGE_NAME bundle install
