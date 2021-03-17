# .DEFAULT_GOAL := generate

all: say_hello generate clean

say_hello:
	@echo "Hello World"

generate:
	@echo "Creating empty text files..."
	touch file_{1..10}.txt

clean:
	@echo "Cleaning up ..."
	rm *.txt
