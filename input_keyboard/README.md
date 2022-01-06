# Scenic Examples: Keyboard Input

This project shows how to handle keyboard input.

Things to note:

* Check [the documentation](https://hexdocs.pm/scenic/overview_scene.html#user-input) for an overview of how input works.
* Note that the scene must subscribe to events using `request_input/2`, usually in its `init` callback.
* The `key` event can be used to detect buttons being pressed down and let up.
* The `codepoint` event can be used to detect entered text.
* Both `key` and `codepoint` events will repeat as a key is held down. The `key` event's second tuple element will let you know if it was up (`0`), down (`1`), or if it has been held down (`2`).
* Modifiers (`shift`, `meta`, `alt`) are included if active for both codepoints and key events..