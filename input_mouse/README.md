# Scenic Examples: Mouse Input

This project shows how to handle mouse input.

Things to note:

* Check [the documentation](https://hexdocs.pm/scenic/overview_scene.html#user-input) for an overview of how input works.
* Note that the scene must subscribe to events using `request_input/2`, usually in its `init` callback.
* Modifiers (`shift`, `meta`, `alt`) are included if active.
* Mouse buttons beyond the normal 3 [currently do not report uniquely](https://github.com/boydm/scenic/issues/258).
* Cursor position events with no buttons down only fire while inside viewpoint, and only have non-negative coordinates.
* Cursor position events with a button down will fire even if mouse moves outside viewport, and may have negative coordinates.