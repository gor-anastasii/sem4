import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Random;
import java.net.InetAddress;

public class Server {
    public static void main(String[] args) {
        try {
            ServerSocket server = new ServerSocket(8030);
            System.out.println("Server start");
            Random random = new Random();
            int number = random.nextInt(100) + 1;
            System.out.println("Guessed " + number);
            while (true) {
                Socket socket = server.accept();
                System.out.println(InetAddress.getLocalHost().getHostName() + " connected");
                ServerClass serverClass = new ServerClass(socket, number);
                serverClass.start();
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}