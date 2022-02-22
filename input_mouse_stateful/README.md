# Scenic Examples: Stateful Mouse Input

This project shows how to handle mouse input with state, e.g., dragging and double-clicking.

Things to note:

* Check [the documentation](https://hexdocs.pm/scenic/overview_scene.html#user-input) for an overview of how input works.
* Note that the scene must subscribe to events using `request_input/2`, usually in its `init` callback.
* Modifiers (`shift`, `meta`, `alt`) are included if active.
* Mouse buttons beyond the normal 3 [currently do not report uniquely](https://github.com/boydm/scenic/issues/258).
* Cursor position events with no buttons down only fire while inside viewpoint, and only have non-negative coordinates.
* Cursor position events with a button down will fire even if mouse moves outside viewport, and may have negative coordinates.
* For second-order events--for instance, double-clicking, which is an instance of two consecutive single-click events--it can make more sense to send up new custom events and add handlers for them
* Use of `Record` is a bit of a performance and size improvement, which for small hot codepaths like input can be helpful
* An alternative, possibly cleaner approach for this could be to treat input events as a stream of symbols and use parser tricks to transform them as makes sense via some automata or FSM (which is in effect what the gross implementation here does)
* If you want to implement something like arcade-style combo moves, the stream of symbols and parser approach is really what you want