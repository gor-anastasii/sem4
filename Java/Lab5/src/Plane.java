
public class Plane implements Runnable{
    public int id;
    public Airport airport;

    public Plane(int id, Airport airport) {
        this.id = id;
        this.airport = airport;
    }

    @Override
    public void run() {
        try {
            airport.land();
            airport.getPassengers();
            airport.takeoff();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            System.err.println("Самолет " + id + "испортился");
        }
    }
}
