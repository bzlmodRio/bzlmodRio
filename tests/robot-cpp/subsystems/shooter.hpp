#pragma once

#include <frc/controller/PIDController.h>
#include <frc/simulation/FlywheelSim.h>
#include <frc2/command/Subsystem.h>

#include <ctre/phoenix6/TalonFX.hpp>

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

  ctre::phoenix6::hardware::TalonFX m_motor;
  frc::PIDController m_controller;

  ctre::phoenix6::controls::VelocityVoltage m_voltageVelocity;

  // Signals
  ctre::phoenix6::StatusSignal<units::angular_velocity::turns_per_second_t>
      &m_velocity;

  // Sim
  ctre::phoenix6::sim::TalonFXSimState &m_motorSim;
  frc::sim::FlywheelSim m_flywheelSim;
};
