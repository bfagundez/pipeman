Pipeman - A Python web ui process executor
=============================================
This tool provides a way to execute several tasks (even rm -rf) using a web ui.
Multiple tasks can be added and executed / restarted, a console output is shown.

This is helpful to execute repetitive tasks and to avoid ssh-ing and a lot of typing.

This is an early implementation so far-- alpha state, improvements coming soon.


Known bugs:
- Not displaying current task status
- Console logging keeps scrolling down all the time
- running proceses trace are lost when another action is invoked or the page refreshed.