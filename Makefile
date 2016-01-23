OBJDIR=obj/
OBJECTS=$(OBJDIR)Robot.o $(OBJDIR)ADIS16448_IMU.o
CXX=arm-frc-linux-gnueabi-g++
CXXFLAGS=-Wall -Wextra -Werror -O2 -g --std=c++11 -I/home/software1/wpilib/cpp/current/include -fmessage-length=0
LD_FLAGS=-L/home/software1/wpilib/cpp/current/lib -Wl,-rpath,/opt/GenICam_v2_3/bin/Linux_armv7-a -lwpi
.PHONY: clean

all: FRCUserProgram
FRCUserProgram: $(OBJECTS)
	$(CXX) $(OBJECTS) $(LD_FLAGS) -o FRCUserProgram -lwpi 

$(OBJECTS) : ADIS16448_IMU.h

$(OBJDIR)%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f FRCUserProgram
	find -name \*.o | xargs rm -f
