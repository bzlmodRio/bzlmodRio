#pragma once

#include <frc2/command/Command.h>
#include <frc2/command/CommandHelper.h>

#include "robot-cpp/subsystems/elevator.hpp"

class SetElevatorSetpoint
    : public frc2::CommandHelper<frc2::Command, SetElevatorSetpoint> {
 public:
  explicit SetElevatorSetpoint(Elevator &elevator, units::meter_t setpoint);
  void Execute() override;
  bool IsFinished() override;
  void End(bool interrupted) override;

 private:
  Elevator &m_elevator;
  units::meter_t m_height;
};
