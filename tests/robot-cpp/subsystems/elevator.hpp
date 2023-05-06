#pragma once

#include <frc/Encoder.h>
#include <frc/motorcontrol/PWMVictorSPX.h>
#include <frc/simulation/ElevatorSim.h>
#include <frc/simulation/EncoderSim.h>
#include <frc2/command/PIDSubsystem.h>

class Elevator : public frc2::PIDSubsystem {
 public:
  Elevator();

  void Stop();

  double GetMeasurement() override;

  void UseOutput(double output, double setpoint) override;

  void Periodic() override;

  void SimulationPeriodic() override;

 private:
  void Log();

  frc::PWMVictorSPX m_motor;
  frc::Encoder m_encoder;
  double m_setpoint{0};

  frc::sim::EncoderSim m_encoderSim;
  frc::sim::ElevatorSim m_elevatorSim;
};
