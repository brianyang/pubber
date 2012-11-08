###
Pubber is a library aimed to make it easier to organize subscriptions, unsubscriptions, and publishes
###

console.log 'pubber init'
#demonstrating how to create, read, update, and delete

window.app = []
pb = pubsub

logger = (topics,data) ->
  console.log 'now subscribed to: ' + topics
  console.log data

app.create = (event) ->
  app.total = pb.subscribe(event,logger) if !app.subscribed

app.read = (event, obj) ->
  pb.publish(event, obj)

app.update = (event,pubval) ->
  pb.publish(event,pubval)

app.del = (event) ->
  pb.unsubscribe event


app.pubber = (event, arg) ->
    app.create(event)
    app.read(event, arg)

app.pubber.revoke = (event) ->
    app.del event





















