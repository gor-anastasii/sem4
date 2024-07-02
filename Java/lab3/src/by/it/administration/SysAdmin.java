package by.it.administration;

import by.it.Worker;
import by.it.programmer.Position;

public class SysAdmin implements Worker {
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


    public SysAdmin(){}
    public SysAdmin(String fio, double salary){
        FIO = fio;
        this.salary = salary;
    }

    public Position getPosition() {
        return position;
    }

    public class Tech{
        public Boolean IsWork = true;

        public Tech(Boolean isWork) {
            IsWork = isWork;
        }
    }

    private final Position position = Position.SYSTEM_ADMINISTRATOR_CASE;

    public void check(){
        System.out.println("The system administrator has checked the system performance.");
    }

    @Override
    public String toString() {
        return position + ": salary - " + getSalary() + " FIO - " + getFIO();
    }
    public class InnerAdmin{
        public void upSalary(){
            System.out.println("The salary of the system administrator has been increased.");
            setSalary(getSalary()+100);
        }
    }
}
