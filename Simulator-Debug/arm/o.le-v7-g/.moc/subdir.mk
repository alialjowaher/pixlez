################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../arm/o.le-v7-g/.moc/moc_ImageExample.cpp \
../arm/o.le-v7-g/.moc/moc_InviteToDownload.cpp \
../arm/o.le-v7-g/.moc/moc_RegistrationHandler.cpp \
../arm/o.le-v7-g/.moc/moc_SocialInvocation.cpp \
../arm/o.le-v7-g/.moc/moc_WebImageView.cpp 

CPP_DEPS += \
./arm/o.le-v7-g/.moc/moc_ImageExample.d \
./arm/o.le-v7-g/.moc/moc_InviteToDownload.d \
./arm/o.le-v7-g/.moc/moc_RegistrationHandler.d \
./arm/o.le-v7-g/.moc/moc_SocialInvocation.d \
./arm/o.le-v7-g/.moc/moc_WebImageView.d 


# Each subdirectory must supply rules for building sources it contributes
arm/o.le-v7-g/.moc/%.o: ../arm/o.le-v7-g/.moc/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: QCC Compiler'
	qcc  -o $@ $< -V4.6.3,gcc_ntox86_cpp -w1 -c -O0 -Wp,-MMD,$(basename $@).d -Wp,-MT,$@
	@echo 'Finished building: $<'
	@echo ' '


