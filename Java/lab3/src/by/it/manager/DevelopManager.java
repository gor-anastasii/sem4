package by.it.manager;

import by.it.Worker;
import by.it.programmer.Position;

public class DevelopManager implements Worker {
    private String FIO;
    public String getFIO() {
        return FIO;
    }

    public void setFIO(String FIO) {
        this.FIO = FIO;
    }

    private double salary;
    @Override
    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public DevelopManager(){
    }
    public DevelopManager(String fio, double salary){
        FIO = fio;
        this.salary = salary;
    }

    public Position getPosition() {
        return position;
    }

    private final Position position = Position.DEVELOPMENT_MANAGER;

    public void advise(){
        System.out.println("The development manager provided some advice.");
    }

    @Override
    public String toString() {
        return position + ": salary - " + getSalary() + " FIO - " + getFIO();
    }
}
