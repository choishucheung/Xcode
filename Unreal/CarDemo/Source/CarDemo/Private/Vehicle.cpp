// Fill out your copyright notice in the Description page of Project Settings.

#include "Public/Vehicle.h"
#include "Camera/CameraComponent.h"

AVehicle::AVehicle(){
    ExternalCamera = CreateDefaultSubobject<UCameraComponent>(TEXT("ExternalCamera"));
}

