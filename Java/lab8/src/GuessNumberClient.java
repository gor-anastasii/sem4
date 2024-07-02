import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class GuessNumberClient {
    private static final String SERVER_ADDRESS = "localhost"; // IP адрес сервера
    private static final int PORT = 8080;

    public static void main(String[] args) {
        try {
            Socket socket = new Socket(SERVER_ADDRESS, PORT);
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);

            BufferedReader userInput = new BufferedReader(new InputStreamReader(System.in));
            String serverResponse;

            while ((serverResponse = in.readLine()) != null) {
                System.out.println(serverResponse);
                if (serverResponse.contains("Congratulation! You guess the number!")) {
                    break;
                }

                String userInputString = userInput.readLine().trim(); // Удаляем пробелы в начале и конце строки
                out.println(userInputString);
            }

            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}