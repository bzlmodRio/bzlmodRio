#pragma once

#include <frc2/command/CommandBase.h>
#include <frc2/command/CommandHelper.h>

#include "robot-cpp/subsystems/shooter.hpp"

class ShooterRpmCommand
    : public frc2::CommandHelper<frc2::CommandBase, ShooterRpmCommand> {
public:
  ShooterRpmCommand(Shooter &shooter, units::revolutions_per_minute_t rpm);
  void Execute() override;
  bool IsFinished() override;
  void End(bool interrupted) override;

private:
  Shooter &m_shooter;
  const units::revolutions_per_minute_t m_rpm;
};
