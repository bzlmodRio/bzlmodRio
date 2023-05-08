// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot.subsystems;

import com.revrobotics.CANSparkMax;
import com.revrobotics.CANSparkMaxLowLevel;
import com.revrobotics.RelativeEncoder;
import edu.wpi.first.hal.SimDouble;
import edu.wpi.first.math.kinematics.DifferentialDriveOdometry;
import edu.wpi.first.wpilibj.ADXRS450_Gyro;
import edu.wpi.first.wpilibj.RobotBase;
import edu.wpi.first.wpilibj.RobotController;
import edu.wpi.first.wpilibj.drive.DifferentialDrive;
import edu.wpi.first.wpilibj.simulation.ADXRS450_GyroSim;
import edu.wpi.first.wpilibj.simulation.DifferentialDrivetrainSim;
import edu.wpi.first.wpilibj.simulation.SimDeviceSim;
import edu.wpi.first.wpilibj.smartdashboard.Field2d;
import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;
import edu.wpi.first.wpilibj2.command.SubsystemBase;

public class DriveTrain extends SubsystemBase {
  private final CANSparkMax m_leftLeader;
  private final CANSparkMax m_leftFollower; // NOPMD(SingularField)
  private final CANSparkMax m_rightLeader;
  private final CANSparkMax m_rightFollower; // NOPMD(SingularField)

  private final DifferentialDrive m_drive;

  private final RelativeEncoder m_leftEncoder;
  private final RelativeEncoder m_rightEncoder;
  private final ADXRS450_Gyro m_gyro;

  private final DifferentialDriveOdometry m_odometry;
  private final Field2d m_field;

  // Sim
  private ADXRS450_GyroSim m_gyroSim;
  private DifferentialDrivetrainSim m_drivetrainSimulator;

  private SimDouble m_leftEncoderPositionSim;
  private SimDouble m_leftEncoderVelocitySim;
  private SimDouble m_rightEncoderPositionSim;
  private SimDouble m_rightEncoderVelocitySim;

  public DriveTrain() {
    m_leftLeader =
        new CANSparkMax(
            PortMap.kDrivetrainMotorLeftAPort, CANSparkMaxLowLevel.MotorType.kBrushless);
    m_leftFollower =
        new CANSparkMax(
            PortMap.kDrivetrainMotorLeftBPort, CANSparkMaxLowLevel.MotorType.kBrushless);
    m_rightLeader =
        new CANSparkMax(
            PortMap.kDrivetrainMotorRightAPort, CANSparkMaxLowLevel.MotorType.kBrushless);
    m_rightFollower =
        new CANSparkMax(
            PortMap.kDrivetrainMotorRightBPort, CANSparkMaxLowLevel.MotorType.kBrushless);

    m_leftFollower.follow(m_leftLeader);
    m_rightFollower.follow(m_rightLeader);

    m_drive = new DifferentialDrive(m_leftLeader, m_rightLeader);

    m_leftEncoder = m_leftLeader.getEncoder();
    m_rightEncoder = m_rightLeader.getEncoder();
    m_gyro = new ADXRS450_Gyro();

    m_odometry = new DifferentialDriveOdometry(m_gyro.getRotation2d(), 0, 0);
    m_field = new Field2d();

    m_leftEncoder.setPositionConversionFactor((4.0 / 12.0 * Math.PI) / 360.0);
    m_rightEncoder.setPositionConversionFactor((4.0 / 12.0 * Math.PI) / 360.0);

    SmartDashboard.putData("Field", m_field);

    if (RobotBase.isSimulation()) {
      m_gyroSim = new ADXRS450_GyroSim(m_gyro);

      SimDeviceSim leftDeviceSim =
          new SimDeviceSim("SPARK MAX [" + m_leftLeader.getDeviceId() + "]");
      m_leftEncoderPositionSim = leftDeviceSim.getDouble("Position");
      m_leftEncoderVelocitySim = leftDeviceSim.getDouble("Velocity");

      SimDeviceSim rightDeviceSim =
          new SimDeviceSim("SPARK MAX [" + m_rightLeader.getDeviceId() + "]");
      m_rightEncoderPositionSim = rightDeviceSim.getDouble("Position");
      m_rightEncoderVelocitySim = rightDeviceSim.getDouble("Velocity");

      // m_leftEncoderSim = new EncoderSim(m_leftEncoder);
      // m_rightEncoderSim = new EncoderSim(m_rightEncoder);
      m_drivetrainSimulator =
          DifferentialDrivetrainSim.createKitbotSim(
              DifferentialDrivetrainSim.KitbotMotor.kDualCIMPerSide,
              DifferentialDrivetrainSim.KitbotGearing.k12p75,
              DifferentialDrivetrainSim.KitbotWheelSize.kSixInch,
              null);
    }
  }

  public void log() {
    SmartDashboard.putNumber("Left Distance", m_leftEncoder.getPosition());
    SmartDashboard.putNumber("Right Distance", m_rightEncoder.getPosition());
    SmartDashboard.putNumber("Left Speed", m_leftEncoder.getVelocity());
    SmartDashboard.putNumber("Right Speed", m_rightEncoder.getVelocity());
    SmartDashboard.putNumber("Gyro", m_gyro.getAngle());
  }

  public void arcadeDrive(double throttle, double rotation) {
    m_drive.arcadeDrive(throttle, rotation);
  }

  public double getHeading() {
    return m_gyro.getAngle();
  }

  /** Reset the robots sensors to the zero states. */
  public void reset() {
    m_gyro.reset();
    m_leftEncoder.setPosition(0);
    m_rightEncoder.setPosition(0);
  }

  public double getAverageDistance() {
    return (m_leftEncoder.getPosition() + m_rightEncoder.getPosition()) / 2;
  }

  void updateOdometry() {
    m_odometry.update(
        m_gyro.getRotation2d(), m_leftEncoder.getPosition(), m_rightEncoder.getPosition());
    m_field.setRobotPose(m_odometry.getPoseMeters());
  }

  @Override
  public void periodic() {
    updateOdometry();
    log();
  }

  @Override
  public void simulationPeriodic() {
    m_drivetrainSimulator.setInputs(
        m_leftLeader.get() * RobotController.getInputVoltage(),
        m_rightLeader.get() * RobotController.getInputVoltage());
    m_drivetrainSimulator.update(0.02);

    m_leftEncoderPositionSim.set(m_drivetrainSimulator.getLeftPositionMeters());
    m_leftEncoderVelocitySim.set(m_drivetrainSimulator.getLeftVelocityMetersPerSecond());
    m_rightEncoderPositionSim.set(m_drivetrainSimulator.getRightPositionMeters());
    m_rightEncoderVelocitySim.set(m_drivetrainSimulator.getRightVelocityMetersPerSecond());
    m_gyroSim.setAngle(-m_drivetrainSimulator.getHeading().getDegrees());
  }

  public void stop() {
    m_leftLeader.set(0);
    m_rightLeader.set(0);
  }
}
