#include "robot-cpp/robot.hpp"

#include <frc2/command/CommandScheduler.h>
#include <frc2/command/button/JoystickButton.h>

#include "cameraserver/CameraServer.h"

#include "robot-cpp/commands/elevator_setpoint_command.hpp"
#include "robot-cpp/commands/joystick_drive_command.hpp"
#include "robot-cpp/commands/shooter_rpm_command.hpp"

void Robot::RobotInit() {
  frc::CameraServer::StartAutomaticCapture();

  m_drivetrain.SetDefaultCommand(
      JoystickDriveCommand{m_joystick, m_drivetrain});

  frc2::JoystickButton shootFastButton{&m_joystick, 1};
  frc2::JoystickButton shootSlowButton{&m_joystick, 2};
  frc2::JoystickButton elevatorLowButton{&m_joystick, 3};
  frc2::JoystickButton elevatorMidButton{&m_joystick, 4};
  frc2::JoystickButton elevatorHighButton{&m_joystick, 5};

  shootFastButton.WhileHeld(ShooterRpmCommand(m_shooter, 1000_rpm));
  shootSlowButton.WhileHeld(ShooterRpmCommand(m_shooter, 1500_rpm));

  elevatorLowButton.WhileHeld(SetElevatorSetpoint(m_elevator, 10_in));
  elevatorMidButton.WhileHeld(SetElevatorSetpoint(m_elevator, 20_in));
  elevatorHighButton.WhileHeld(SetElevatorSetpoint(m_elevator, 30_in));
}

void Robot::RobotPeriodic() { frc2::CommandScheduler::GetInstance().Run(); }

