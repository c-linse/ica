#curl -H "user: debug" http://localhost:8080 | grep -E 'CITY|NAME'

curl http://localhost:8080 | grep -E 'CITY|NAME'