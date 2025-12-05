#include "robot-cpp/commands/elevator_setpoint_command.hpp"

#include <cmath>

SetElevatorSetpoint::SetElevatorSetpoint(Elevator& elevator,
                                         units::meter_t setpoint)
    : m_elevator(elevator), m_height(setpoint) {
  AddRequirements(&m_elevator);

  m_height = setpoint;
}

void SetElevatorSetpoint::Execute() { m_elevator.GoToHeight(m_height); }
bool SetElevatorSetpoint::IsFinished() { return m_elevator.IsAtHeight(); }
void SetElevatorSetpoint::End(bool /* interrupted */) { m_elevator.Stop(); }
