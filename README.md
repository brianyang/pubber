# Pubber Event Driven Application Framework

An observer-like implementation facilitating a network of susbcriptions
for event-driven architectures.

# Todo Application with Pubber

## able to
* create lists
* remove items

## waiting to
* check off items
* clear completed


# Motivations

* An event driven application architecture
* loose coupling


# usage:
```coffeescriptxxx
pubber(customEventName, argument)
```


# examples

## Subscribing to custom events and expected arguments
This creates a subscription to a custom event name and passes an
argument to be evaluated when subscribed. Invoking pubber will create a
subscription and then publish to ensure the subscription reaches the
subscriber.

```coffeescript
pubber newSignup
	action:'notify'
```

## unsubscribe from custom event
Cancel all subscriptions to the specified event name.
```coffeescript
app.pubber.revoke newSignup
```


## publish argument to an event name

```coffeescript
app.pubber newSignup
	action:'change'
```


