all:
	g++ -O3 -Wall -Werror -std=c++11 -c src/*cpp
	g++ -O3 -Wall -Werror -std=c++11 -I./src/ *o toyrobot.cpp -o toyrobot
	strip toyrobot
	rm *.o

clean:
	rm toyrobot
