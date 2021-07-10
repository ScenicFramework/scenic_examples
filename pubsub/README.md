# Scenic Examples: Pubsub

This project is meant to show how to use `Scenic.PubSub`.

Things to note:

* You can use `Scenic.PubSub.register/2` to register a source for broadcasting on the PubSub bus.
* You can use `Scenic.PubSub.subscribe/1` to request a process get info messages for data publishing, source registration, and source deregistration.
* You can use `Scenic.PubSub.publish/2` to publish a value for a given source. This will be timestamped internally.
* You can use `Scenic.PubSub.list/0` to get all the active sources.
* You can use `Scenic.PubSub.get/1` to pull the latest datapoint for a given source.