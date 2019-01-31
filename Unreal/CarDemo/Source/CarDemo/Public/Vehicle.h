// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "WheeledVehicle.h"
#include "Vehicle.generated.h"
class UCameraComponent;
class USpringArmComponent;
/**
 * 
 */
UCLASS()
class CARDEMO_API AVehicle : public AWheeledVehicle
{
	GENERATED_BODY()
    
protected:
    UPROPERTY(VisibleAnywhere,Category="CameraComponent")
    UCameraComponent* ExternalCamera;
    
    UPROPERTY(VisibleAnywhere,Category="CameraComponent")
    USpringArmComponent* SpringArm;
    
    void MoveForward(float Value);
    void MoveRight(float Value);
    
    void OnHandBreakPressed();
    void OnHandBreakReleased();
    
public:
    AVehicle();
    virtual void SetupPlayerInputComponent(UInputComponent* PlayerInputComponent) override;
};
