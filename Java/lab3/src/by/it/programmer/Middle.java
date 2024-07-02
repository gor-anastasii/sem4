package by.it.programmer;

public class Middle extends Programmer{

    public Middle(){
        super();
    }
    public Middle(String fio, double salary){
        super(fio,salary);
    }

    public Position getPosition() {
        return position;
    }

    private final Position position = Position.MIDDLE_CASE;

    @Override
    public void work(){
        System.out.println("Middle is doing something");
    }

    @Override
    public String toString() {
        return position + ": salary - " + getSalary() + " FIO - " + getFIO();
    }
}
