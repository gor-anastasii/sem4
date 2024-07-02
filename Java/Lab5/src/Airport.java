import java.util.concurrent.*;
public class Airport {
    public int terminalsCount;
    public int rampsCount;
    public int planeCapacity;
    public Semaphore terminals;
    public Semaphore ramps;
    public ExecutorService executor;

    public Airport(int terminalsCount, int rampsCount, int planeCapacity, int planesCount) {
        this.terminalsCount = terminalsCount;
        this.rampsCount = rampsCount;
        this.planeCapacity = planeCapacity;

        this.terminals = new Semaphore(terminalsCount);
        this.ramps = new Semaphore(rampsCount);

        this.executor = Executors.newFixedThreadPool(terminalsCount + rampsCount);
        for (int i = 0; i < planesCount; i++) {
            executor.execute(new Plane(i + 1, this));
        }
    }

    public void land() throws InterruptedException {
        ramps.acquire();
        System.out.println("Самолет ждет на трапе: " + Thread.currentThread().getName());
    }

    public void getPassengers() throws InterruptedException {
        terminals.acquire();
        System.out.println("Пасадка пассажиров: " + Thread.currentThread().getName());
        Thread.sleep(3000);
        terminals.release();
    }

    public void takeoff() throws InterruptedException {
        terminals.acquire();
        System.out.println("Самолет взлетает: " + Thread.currentThread().getName());
        Thread.sleep(2000);
        terminals.release();
        ramps.release();
    }

    public void shutdown() {
        executor.shutdown();
    }
}
