#pragma once

#include <frc2/command/CommandHelper.h>
#include <frc2/command/PIDCommand.h>

#include "robot-cpp/subsystems/elevator.hpp"

class SetElevatorSetpoint
    : public frc2::CommandHelper<frc2::PIDCommand, SetElevatorSetpoint> {
public:
  explicit SetElevatorSetpoint(Elevator &elevator, units::meter_t setpoint);
  void End(bool interrupted) override;

private:
  Elevator &m_elevator;
};
