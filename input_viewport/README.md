# Scenic Examples: Viewport Input

This project shows how to handle viewport event input.

Things to note:

* Check [the documentation](https://hexdocs.pm/scenic/overview_scene.html#user-input) for an overview of how input works.
* Note that the scene must subscribe to events using `request_input/2`, usually in its `init` callback.
* Note that coordinates sent for `:enter` and `:exit` events may be negative.