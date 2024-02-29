// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot.subsystems;

import com.ctre.phoenix6.StatusSignal;
import com.ctre.phoenix6.controls.VelocityVoltage;
import com.ctre.phoenix6.hardware.TalonFX;
import com.ctre.phoenix6.sim.TalonFXSimState;
import edu.wpi.first.math.system.plant.DCMotor;
import edu.wpi.first.wpilibj.RobotBase;
import edu.wpi.first.wpilibj.RobotController;
import edu.wpi.first.wpilibj.simulation.FlywheelSim;
import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;
import edu.wpi.first.wpilibj2.command.SubsystemBase;

/**
 * The claw subsystem is a simple system with a motor for opening and closing. If using stronger
 * motors, you should probably use a sensor so that the motors don't stall.
 */
public class Shooter extends SubsystemBase {
  private static final DCMotor kGearbox = DCMotor.getVex775Pro(2);
  private static final double kGearing = 4;
  private static final double kInertia = 0.008;

  private final TalonFX m_motor;

  private final VelocityVoltage m_voltageVelocity;

  // Signals
  private final StatusSignal<Double> m_velocity;

  // Sim
  private TalonFXSimState m_motorSim;
  private FlywheelSim m_flywheelSim;

  /** Create a new claw subsystem. */
  public Shooter() {
    m_motor = new TalonFX(PortMap.kShooterMotorPort);
    m_voltageVelocity = new VelocityVoltage(0, 0, true, 0, 0, false, false, false);
    m_velocity = m_motor.getVelocity();

    if (RobotBase.isSimulation()) {
      m_motorSim = m_motor.getSimState();
      m_flywheelSim = new FlywheelSim(kGearbox, kGearing, kInertia);
    }
  }

  public void log() {
    SmartDashboard.putNumber("Shooter Speed", m_motor.get());
    SmartDashboard.putNumber("Shooter RPM", getRpm());
  }

  public void stop() {
    m_motor.set(0);
  }

  public void spinAtRpm(double rpm) {
    m_motor.setControl(m_voltageVelocity.withVelocity(rpm));
  }

  double getRpm() {
    return m_velocity.getValue();
  }

  @Override
  public void periodic() {
    log();
  }

  @Override
  public void simulationPeriodic() {
    m_flywheelSim.setInput(m_motor.get() * RobotController.getInputVoltage());

    m_flywheelSim.update(0.02);
    m_motorSim.setRawRotorPosition(m_flywheelSim.getAngularVelocityRPM());
  }
}
