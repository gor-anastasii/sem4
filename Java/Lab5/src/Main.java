public class Main {
    public static void main(String[] args) {
        CallCenter callCenter = new CallCenter(3);

        for (int i = 0; i < 3; i++) {
            Operator operator = new Operator(callCenter);
            operator.start();
        }
        

        for (int i = 0; i < 10; i++) {
            String clientName = "Клиент " + (i + 1);
            callCenter.receiveCall(clientName);
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            callCenter.endCall(clientName);
        }

        //--------------------------------------------------------

        int terminalsCount = 2;
        int rampsCount = 1;
        int planeCapacity = 150;
        int planesCount = 3;

        Airport airport = new Airport(terminalsCount, rampsCount, planeCapacity, planesCount);

        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        airport.shutdown();
    }
}
