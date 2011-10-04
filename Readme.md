# Sinatra Streaming Example

A simple demonstration of streaming Redis pub/sub data over HTTP via Sinatra's new streaming capabilities.

## See it live:

```bash
curl https://sinatra-streaming-example.herokuapp.com/stream
```

## Deploying your own

```bash
$ heroku create --stack cedar
$ heroku addons:add redistogo:nano
$ git push heroku master
```
