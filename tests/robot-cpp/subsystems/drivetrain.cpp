#include "robot-cpp/subsystems/drivetrain.hpp"

#include <frc/Joystick.h>
#include <frc/RobotController.h>
#include <frc/smartdashboard/SmartDashboard.h>
#include <units/length.h>

#include <iostream>
#include <numbers>

#include "frc/simulation/SimDeviceSim.h"
#include "robot-cpp/subsystems/ports.hpp"

DriveTrain::DriveTrain()
    : m_leftMotorA{kDrivetrainMotorLeftAPort,
                   rev::CANSparkMax::MotorType::kBrushless},
      m_leftMotorB{kDrivetrainMotorLeftBPort,
                   rev::CANSparkMax::MotorType::kBrushless},
      m_leftEncoder{m_leftMotorA.GetEncoder()},
      m_rightMotorA{kDrivetrainMotorRightAPort,
                    rev::CANSparkMax::MotorType::kBrushless},
      m_rightMotorB{kDrivetrainMotorRightBPort,
                    rev::CANSparkMax::MotorType::kBrushless},
      m_rightEncoder{m_rightMotorA.GetEncoder()},
      m_robotDrive{m_leftMotorA, m_rightMotorA},
      m_odometry{frc::Rotation2d(), 0_m, 0_m}, m_gyroSim{m_gyro},
      m_drivetrainSimulator(
          frc::sim::DifferentialDrivetrainSim::CreateKitbotSim(
              frc::sim::DifferentialDrivetrainSim::KitbotMotor::DualCIMPerSide,
              12.0, 6_in)) {
  frc::SmartDashboard::PutData("Field", &m_field);

  frc::sim::SimDeviceSim leftDeviceSim(
      ("SPARK MAX [" + std::to_string(m_leftMotorA.GetDeviceId()) + "]")
          .c_str());
  m_leftEncoderPositionSim = leftDeviceSim.GetDouble("Position");
  m_leftEncoderVelocitySim = leftDeviceSim.GetDouble("Velocity");

  frc::sim::SimDeviceSim rightDeviceSim(
      ("SPARK MAX [" + std::to_string(m_rightMotorA.GetDeviceId()) + "]")
          .c_str());
  std::cout << "Hello: " << rightDeviceSim << ", " << leftDeviceSim
            << std::endl;
  m_rightEncoderPositionSim = rightDeviceSim.GetDouble("Position");
  m_rightEncoderVelocitySim = rightDeviceSim.GetDouble("Velocity");

  m_leftMotorB.Follow(m_leftMotorA);
  m_rightMotorB.Follow(m_rightMotorA);

  SetName("DriveTrain");
}

void DriveTrain::Log() {
  frc::SmartDashboard::PutNumber("Left Distance",
                                 GetLeftEncoderDistance().to<double>());
  frc::SmartDashboard::PutNumber("Right Distance",
                                 GetRightEncoderDistance().to<double>());
  frc::SmartDashboard::PutNumber("Left Speed",
                                 GetLeftEncoderVelocity().to<double>());
  frc::SmartDashboard::PutNumber("Right Speed",
                                 GetRightEncoderVelocity().to<double>());
  frc::SmartDashboard::PutNumber("Gyro", GetHeadingDegrees());
}

void DriveTrain::ArcadeDrive(double throttle, double rotation) {
  m_robotDrive.ArcadeDrive(throttle, rotation);
}

double DriveTrain::GetHeadingDegrees() {
  return GetRotation().Degrees().to<double>();
}

frc::Rotation2d DriveTrain::GetRotation() { return m_gyro.GetRotation2d(); }

void DriveTrain::Reset() {
  m_gyro.Reset();
  m_leftEncoder.SetPosition(0);
  m_rightEncoder.SetPosition(0);
}

double DriveTrain::GetAverageDistance() {
  return (GetLeftEncoderDistance() + GetRightEncoderDistance()).to<double>() /
         2.0;
}

void DriveTrain::UpdateOdometry() {
  m_odometry.Update(GetRotation(), GetLeftEncoderDistance(),
                    GetRightEncoderDistance());
  m_field.SetRobotPose(m_odometry.GetPose());
}

void DriveTrain::Periodic() {
  UpdateOdometry();
  Log();
}

void DriveTrain::SimulationPeriodic() {
  // To update our simulation, we set motor voltage inputs, update the
  // simulation, and write the simulated positions and velocities to our
  // simulated encoder and gyro. We negate the right side so that positive
  // voltages make the right side move forward.
  m_drivetrainSimulator.SetInputs(units::volt_t{m_leftMotorA.Get()} *
                                      frc::RobotController::GetInputVoltage(),
                                  units::volt_t{-m_rightMotorA.Get()} *
                                      frc::RobotController::GetInputVoltage());
  m_drivetrainSimulator.Update(20_ms);

  m_leftEncoderPositionSim.Set(
      m_drivetrainSimulator.GetLeftPosition().to<double>());
  m_leftEncoderVelocitySim.Set(
      m_drivetrainSimulator.GetLeftVelocity().to<double>());
  m_rightEncoderPositionSim.Set(
      m_drivetrainSimulator.GetRightPosition().to<double>());
  m_rightEncoderVelocitySim.Set(
      m_drivetrainSimulator.GetRightVelocity().to<double>());
  m_gyroSim.SetAngle(-m_drivetrainSimulator.GetHeading().Degrees());
}

units::meter_t DriveTrain::GetLeftEncoderDistance() {
  return units::meter_t{m_leftEncoder.GetPosition()};
}

units::meter_t DriveTrain::GetRightEncoderDistance() {
  return units::meter_t{m_rightEncoder.GetPosition()};
}

units::meters_per_second_t DriveTrain::GetLeftEncoderVelocity() {
  return units::meters_per_second_t{m_leftEncoder.GetVelocity()};
}

units::meters_per_second_t DriveTrain::GetRightEncoderVelocity() {
  return units::meters_per_second_t{m_rightEncoder.GetVelocity()};
}
