// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot.commands;

import edu.wpi.first.wpilibj2.command.Command;
import frc.robot.subsystems.Elevator;

public class SetElevatorSetpointCommand extends Command {
  private final Elevator m_elevator;
  private final double m_height;

  public SetElevatorSetpointCommand(Elevator elevator, double setpoint) {
    m_elevator = elevator;
    m_height = setpoint;
  }

  public void execute() {
    m_elevator.goToHeight(m_height);
  }

  @Override
  public boolean isFinished() {
    return m_elevator.isAtHeight();
  }
}
