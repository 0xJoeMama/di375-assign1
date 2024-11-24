DIR=build
SRC= majority_old.vhdl majority_tb.vhdl
ENTITY=majority_tb

all: clean make

make: compile
	ghdl make --workdir=build $(ENTITY)

compile: $(DIR)
	ghdl compile --workdir=build $(SRC)

clean:
	rm -rf $(DIR) $(ENTITY) *.o

$(DIR):
	mkdir -p $(DIR)
