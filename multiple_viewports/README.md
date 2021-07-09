# Scenic Examples: Multiple Viewports

This project shows how to setup multiple viewports, each with a different scene.

Key things to note:

* You need to have separate viewport configurations, with different `driver.name`s.
* You need to supply multiple viewports to the Scenic child process in the app `start/2` function.
