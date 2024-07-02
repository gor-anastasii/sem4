package by.it.head;

import by.it.Worker;
import by.it.WorkerNotFoundException;
import by.it.programmer.Position;
import by.it.company.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

interface CEOInterface {
    void analysis();
}

public class Ceo implements CEOInterface, Worker {
    private double salary;
    @Override
    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    private String FIO;

    public String getFIO() {
        return FIO;
    }

    public void setFIO(String FIO) {
        this.FIO = FIO;
    }

    public Ceo(){
    }
    public Ceo(String fio, double salary){
        FIO = fio;
        this.salary = salary;
    }
    private final Position position = Position.CEO_CASE;

    @Override
    public Position getPosition() {
        return position;
    }

    public void analysis(){
        System.out.println("Ceo worker is analyzing the market and setting new goals.");
    }

    public void setNewStrategy(){
        System.out.println("Ceo worker has implemented a new development strategy.");
    }

    public int countWorkers(Company company){
        return company.workers.size();
    }

    public Company sortBySalary(Company company) {
        ArrayList<Object> workers = company.workers;

        Comparator<Object> salaryComparator = Comparator.comparingDouble(worker -> {
            if (worker instanceof Worker) {
                return ((Worker) worker).getSalary();
            }
            return 0.0;
        });
        Collections.sort(workers, salaryComparator);

        company.workers = workers;

        return company;
    }

    public void findWorker(Company company, Position position) {
        try{
            ArrayList<Object> workers = company.workers;
            ArrayList<Worker> found = new ArrayList<>();
            for (Object worker : workers) {
                if (worker instanceof Worker) {
                    Worker programmer = (Worker) worker;
                    if (programmer.getPosition() == position) {
                        found.add(programmer);
                    }
                }
            }
            if(found.size() != 0){
                for (Object worker: found) {
                    System.out.println(worker);
                }
            }
            else {
                throw new WorkerNotFoundException("worker " + position + " not found");
            }
        }
        catch (WorkerNotFoundException e){
            System.out.println("Employee not found: " + e.getMessage());
        }
    }

    @Override
    public String toString() {
        return position + ": salary - " + getSalary() + " FIO - " + getFIO();
    }
}
