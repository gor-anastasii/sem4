import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Random;

public class Server {
    private static final int PORT = 8080;
    private static final int MAX_NUMBER = 100;

    public static void main(String[] args) {
        try {
            ServerSocket serverSocket = new ServerSocket(PORT);
            System.out.println("Server is running. Waiting to connection...");

            while (true) {
                Socket clientSocket = serverSocket.accept();
                System.out.println("Client is connected: " + clientSocket.getInetAddress());

                // Генерация случайного числа для угадывания
                int numberToGuess = new Random().nextInt(MAX_NUMBER) + 1;

                // Создание нового потока для обработки клиента
                Thread clientThread = new Thread(new Client(clientSocket, numberToGuess));
                clientThread.start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}