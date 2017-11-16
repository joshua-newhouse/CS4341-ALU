GUI
===

The GUI was developed using Flask and Docker. Flask is used as a web interface for the user. The Verilog is run as the backend by templating out user supplied variables and grabbing the output to return it to the user. Docker is used to provide a reproducible run environment.

Running
-------

Docker Compose is required to run the gui. Docker compose can be found here: https://docs.docker.com/compose/

The gui can then be run with:
	
	docker-compose up
	
And the GUI will be availale on your machine on port 5000.
