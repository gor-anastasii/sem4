class Operator extends Thread {
    private CallCenter callCenter;

    public Operator(CallCenter callCenter) {
        this.callCenter = callCenter;
    }

    @Override
    public void run() {
        while (true) {
            synchronized (callCenter) {
                while (callCenter.waitingQueue.isEmpty()) {
                    try {
                        callCenter.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }

            String clientName = callCenter.waitingQueue.poll();
            System.out.println("Оператор обслуживает: " + clientName);
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            callCenter.endCall(clientName);
        }
    }
}