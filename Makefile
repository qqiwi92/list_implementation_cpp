CXX = g++
CXXFLAGS = -std=c++20 -Wall -Wextra -Werror -I.

LIBS = -lboost_unit_test_framework

TARGET = lab
TEST_TARGET = test_runner

SRCS = main.cpp io.cpp
OBJS = $(SRCS:.cpp=.o)

TEST_SRCS = test-main.cpp test-list.cpp test-io.cpp io.cpp
TEST_OBJS = $(TEST_SRCS:.cpp=.o)

all: $(TARGET)
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

$(TEST_TARGET): $(TEST_OBJS)
	$(CXX) $(CXXFLAGS) -o $(TEST_TARGET) $(TEST_OBJS) $(LIBS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: $(TARGET)
	./$(TARGET)

test: $(TEST_TARGET)
	./$(TEST_TARGET)

clean:
	rm -f $(TARGET) $(TEST_TARGET) *.o

.PHONY: all clean run test
