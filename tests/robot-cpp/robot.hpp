#pragma once

#include <frc/Joystick.h>
#include <frc/TimedRobot.h>

#include "robot-cpp/subsystems/drivetrain.hpp"
#include "robot-cpp/subsystems/elevator.hpp"
#include "robot-cpp/subsystems/shooter.hpp"

class Robot : public frc::TimedRobot {
 public:
  void RobotInit() override;
  void RobotPeriodic() override;

 private:
  frc::Joystick m_joystick{0};

  Elevator m_elevator;
  DriveTrain m_drivetrain;
  Shooter m_shooter;
};
