package by.it.programmer;

public class Senior extends Programmer {

    public Senior(){
        super();
    }
    public Senior(String fio, double salary){
        super(fio,salary);
    }

    public Position getPosition() {
        return position;
    }

    private final Position position = Position.SENIOR_CASE;

    @Override
    public void work(){
        System.out.println("Quiet, Senior is working");
    }


}
