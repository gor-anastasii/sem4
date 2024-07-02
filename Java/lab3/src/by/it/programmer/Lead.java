package by.it.programmer;

public class Lead extends Programmer{

    public Lead(){
        super();
    }
    public Lead(String fio, double salary){
        super(fio,salary);
    }

    public Position getPosition() {
        return position;
    }

    private final Position position = Position.LEAD_CASE;

    @Override
    public void work(){
        System.out.println("This is a serious matter, the lead is working");
    }

    @Override
    public String toString() {
        return position + ": salary - " + getSalary() + " FIO - " + getFIO();
    }
}
