// Fill out your copyright notice in the Description page of Project Settings.

#include "Public/Vehicle.h"
#include "Camera/CameraComponent.h"
#include "WheeledVehicleMovementComponent.h"
#include "WheeledVehicleMovementComponent4W.h"
#include "GameFramework/SpringArmComponent.h"
#include "Components/SkeletalMeshComponent.h"
#include "Engine/SkeletalMesh.h"
#include "FrontVehicleWheel.h"
#include "RearVehicleWheel.h"

AVehicle::AVehicle(){
    static ConstructorHelpers::FObjectFinder<USkeletalMesh>CarMesh(TEXT("/Game/TestCar/Car"));
    GetMesh()->SetSkeletalMesh(CarMesh.Object);
    
    SpringArm = CreateDefaultSubobject<USpringArmComponent>(TEXT("SpringArm"));
    SpringArm->SetupAttachment(RootComponent);
    
    SpringArm->bEnableCameraRotationLag = true;
    SpringArm->CameraRotationLagSpeed=7.5f;
    
    ExternalCamera = CreateDefaultSubobject<UCameraComponent>(TEXT("ExternalCamera"));
    ExternalCamera->SetupAttachment(SpringArm);
    UWheeledVehicleMovementComponent4W* Vehicle4W = CastChecked<UWheeledVehicleMovementComponent4W>(GetVehicleMovement());
    check(Vehicle4W->WheelSetups.Num()==4);
    
    
    
    Vehicle4W->WheelSetups[0].WheelClass = UFrontVehicleWheel::StaticClass();
    Vehicle4W->WheelSetups[1].WheelClass = UFrontVehicleWheel::StaticClass();
    Vehicle4W->WheelSetups[2].WheelClass = URearVehicleWheel::StaticClass();
    Vehicle4W->WheelSetups[3].WheelClass = URearVehicleWheel::StaticClass();
    Vehicle4W->WheelSetups[0].BoneName = FName("right_front_bone");
    Vehicle4W->WheelSetups[1].BoneName = FName("left_front_bone");
    Vehicle4W->WheelSetups[2].BoneName = FName("right_rear_bone");
    Vehicle4W->WheelSetups[3].BoneName = FName("left_rear_bone");
}

void AVehicle::MoveForward(float Value){
    GetVehicleMovementComponent()->SetThrottleInput(Value);
}

void AVehicle::MoveRight(float Value){
    GetVehicleMovementComponent()->SetSteeringInput(Value);
}
void AVehicle::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent){
    Super::SetupPlayerInputComponent(PlayerInputComponent);
    PlayerInputComponent->BindAxis("MoveForward",this,&AVehicle::MoveForward);
    PlayerInputComponent->BindAxis("MoveRight",this,&AVehicle::MoveRight);
    PlayerInputComponent->BindAction("Handlebreak",IE_Pressed,this,&AVehicle::OnHandBreakPressed);
    PlayerInputComponent->BindAction("Handlebreak",IE_Released,this,&AVehicle::OnHandBreakReleased);
}


void AVehicle::OnHandBreakPressed(){
    GetVehicleMovementComponent()->SetHandbrakeInput(true);
}
void AVehicle::OnHandBreakReleased(){
    GetVehicleMovementComponent()->SetHandbrakeInput(false);
}
