## build_front: builds the front end
build_front:
	@echo "Building front end..."
	
	@echo "Front end built!"

## build_back: builds the back end
build_back:
	@echo "Building back end..."
	
	@echo "Back end built!"

## start: starts front and back end
start: start_front start_back
	
## start_front: starts the front end
start_front: 
	@echo "Starting the front end..."
	
	@echo "Front end running!"

## start_back: starts the back end
start_back: build_back
	@echo "Starting the back end..."
	@echo "Back end running!"


