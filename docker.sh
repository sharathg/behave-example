echo "*** Docker Version ***"
docker -v
echo ""
echo ""
echo "*** Docker Build ***"
docker build --iidfile image.id -t behave-example:latest .
cat image.id
echo ""
echo ""
echo "*** Test Docker ***"
docker run -i -u 1000:1000 -v $PWD:/workspace/ -w /workspace $(cat image.id) bash python3 -m behave