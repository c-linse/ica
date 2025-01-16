
curl -s http://localhost:31380 | grep title

curl -s -H "x-dark-release: deployed" http://localhost:31380 | grep title

