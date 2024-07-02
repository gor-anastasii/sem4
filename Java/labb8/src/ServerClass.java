import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Objects;

public class ServerClass extends Thread {
    private final PrintStream os;
    private final BufferedReader is;
    private final InetAddress addr;
    private final Socket socket;
    private final int number;
    public ServerClass(Socket s, int number) throws IOException {
        os = new PrintStream(s.getOutputStream());
        is = new BufferedReader(new InputStreamReader(s.getInputStream()));
        addr = s.getInetAddress();
        socket = s;
        this.number = number;
    }
    public void run() {
        try {
            while (true) {
                String str = is.readLine();
                if (str == null || str.equals("disc")) {
                    break;
                }
                int guess = Integer.parseInt(str);
                if (guess < 1 || guess > 100) {
                    os.println("Number should be between 1 and 100");
                } else if (guess == number) {
                    os.println("Good");
                    System.out.println(addr.getLocalHost().getHostName() + " guessed the number " + number);
                    break;
                } else {
                    String message = guess < number ? "Number is greater" : "Number is smaller";
                    os.println(message);
                }
                System.out.println(addr.getLocalHost().getHostName()+ ": " + str);
            }
        } catch (IOException e) {
            System.err.println("Error: " + e.getMessage());
        } finally {
            try {
                disconnect();
            } catch (IOException e) {
                System.err.println("Error: " + e.getMessage());
            }
        }
    }

    public void disconnect() throws IOException {
        try {
            if (os != null) {
                os.close();
            }
            if (is != null) {
                is.close();
            }
            System.out.println(addr.getLocalHost().getHostName() + " disconnected");
        } finally {
            socket.close();
            this.interrupt();
        }
    }
}