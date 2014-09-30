################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/ImageExample.cpp \
../src/InviteToDownload.cpp \
../src/RegistrationHandler.cpp \
../src/SocialInvocation.cpp \
../src/WebImageView.cpp \
../src/main.cpp 

CPP_DEPS += \
./src/ImageExample.d \
./src/InviteToDownload.d \
./src/RegistrationHandler.d \
./src/SocialInvocation.d \
./src/WebImageView.d \
./src/main.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: QCC Compiler'
	qcc  -o $@ $< -V4.6.3,gcc_ntox86_cpp -w1 -c -O0 -Wp,-MMD,$(basename $@).d -Wp,-MT,$@
	@echo 'Finished building: $<'
	@echo ' '


