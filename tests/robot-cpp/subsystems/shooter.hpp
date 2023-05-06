#pragma once

#include <frc/controller/PIDController.h>
#include <ctre/phoenix/motorcontrol/can/WPI_TalonSRX.h>
#include <frc/simulation/FlywheelSim.h>
#include <frc2/command/SubsystemBase.h>

class Shooter : public frc2::SubsystemBase {
 public:
  Shooter();

  void Periodic() override;
  void SimulationPeriodic() override;

  void Stop();

  void SpinAtRpm(units::revolutions_per_minute_t rpm);

  units::revolutions_per_minute_t GetRpm();

 private:
  void Log();

  ctre::phoenix::motorcontrol::can::WPI_TalonSRX m_motor;
  frc2::PIDController m_controller;

  // Sim
  frc::sim::FlywheelSim m_flywheelSim;
};
