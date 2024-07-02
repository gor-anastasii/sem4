import java.util.LinkedList;
import java.util.Queue;

public class CallCenter {
    public int operatorsCount;
    public Queue<String> waitingQueue;

    public CallCenter(int operatorsCount) {
        this.operatorsCount = operatorsCount;
        this.waitingQueue = new LinkedList<>();
    }

    public synchronized void receiveCall(String clientName) {
        if (operatorsCount > 0) {
            operatorsCount--;
            System.out.println(clientName + " соединяется с оператором.");
        } else {
            waitingQueue.offer(clientName);
            System.out.println(clientName + " ждёт свободного оператора.");
        }
    }

    public synchronized void endCall(String clientName) {
        operatorsCount++;
        System.out.println(clientName + " закончил соединение.");
        if (!waitingQueue.isEmpty()) {
            String nextClient = waitingQueue.poll();
            System.out.println("Подключение следующего клиента: " + nextClient);
        }
    }
}
