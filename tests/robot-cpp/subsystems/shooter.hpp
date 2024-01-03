#pragma once

#include <ctre/phoenix/motorcontrol/can/WPI_TalonSRX.h>
#include <frc/controller/PIDController.h>
#include <frc/simulation/FlywheelSim.h>
#include <frc2/command/Subsystem.h>

class Shooter : public frc2::Subsystem {
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
  frc::PIDController m_controller;

  // Sim
  frc::sim::FlywheelSim m_flywheelSim;
};
