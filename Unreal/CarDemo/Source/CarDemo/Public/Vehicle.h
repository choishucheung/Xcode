// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "WheeledVehicle.h"
#include "Vehicle.generated.h"
class UcameraComponent;
/**
 * 
 */
UCLASS()
class CARDEMO_API AVehicle : public AWheeledVehicle
{
	GENERATED_BODY()
    UPROPERTY(VisiableAnywhere,Category="CameraComponent");
    UcameraComponent* ExternalCamera;
    AVehicle();
    
};
