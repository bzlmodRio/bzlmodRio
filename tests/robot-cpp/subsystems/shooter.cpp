#include "robot-cpp/subsystems/shooter.hpp"

#include <frc/smartdashboard/SmartDashboard.h>

#include "robot-cpp/subsystems/ports.hpp"

namespace {
constexpr double kP = 0.01;
constexpr double kI = 0.0;
constexpr double kD = 0.0;

constexpr frc::DCMotor kGearbox = frc::DCMotor::Vex775Pro(2);
constexpr double kGearing = 4;
constexpr units::kilogram_square_meter_t kInertia{0.008};

} // namespace

Shooter::Shooter()
    : m_motor{kShooterMotorPort}, m_controller{kP, kI, kD},
      m_voltageVelocity{0_tps, 0_tr_per_s_sq, true, 0_V, 0, false},
      m_velocity(m_motor.GetVelocity()), m_motorSim(m_motor.GetSimState()),
      m_flywheelSim(kGearbox, kGearing, kInertia) {}

void Shooter::Stop() { m_motor.Set(0); }

void Shooter::SpinAtRpm(units::revolutions_per_minute_t rpm) {
  m_motor.SetControl(m_voltageVelocity.WithVelocity(rpm));
}
units::revolutions_per_minute_t Shooter::GetRpm() {
  return m_velocity.GetValue();
}

void Shooter::Periodic() { Log(); }

void Shooter::SimulationPeriodic() {
  m_flywheelSim.SetInput(Eigen::Vector<double, 1>(
      m_motor.Get() * frc::RobotController::GetInputVoltage()));

  m_flywheelSim.Update(20_ms);
  m_motorSim.SetRotorVelocity(m_flywheelSim.GetAngularVelocity());
}

void Shooter::Log() {
  frc::SmartDashboard::PutNumber("Shooter Speed", m_motor.Get());
  frc::SmartDashboard::PutNumber("Shooter RPM", GetRpm().to<double>());
}
