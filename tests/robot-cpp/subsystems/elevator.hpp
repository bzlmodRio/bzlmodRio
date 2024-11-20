#pragma once

#include <frc/Encoder.h>
#include <frc/controller/PIDController.h>
#include <frc/motorcontrol/PWMVictorSPX.h>
#include <frc/simulation/ElevatorSim.h>
#include <frc/simulation/EncoderSim.h>
#include <frc2/command/Subsystem.h>

#include "robot-cpp/subsystems/ports.hpp"

class Elevator : public frc2::Subsystem {
 public:
  Elevator();

  void Stop();

  void SetVoltage(double output);

  void GoToHeight(units::meter_t height);

  bool IsAtHeight();

  void Periodic() override;

  void SimulationPeriodic() override;

 private:
  void Log();

  frc::PWMVictorSPX m_motor{kElevatorMotorPort};
  frc::Encoder m_encoder{kElevatorEncoderPortA, kElevatorEncoderPortB};
  double m_setpoint{0};
  frc::PIDController m_controller;

  frc::sim::EncoderSim m_encoderSim{m_encoder};
  frc::sim::ElevatorSim m_elevatorSim;
};
