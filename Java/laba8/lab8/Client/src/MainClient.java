import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;

public class MainClient {
    public static void main(String[] args) throws IOException {
        Socket socketClient = new Socket("0.0.0.0", 8030);
        BufferedReader in = new BufferedReader(new InputStreamReader(socketClient.getInputStream()));
        OutputStream out = socketClient.getOutputStream();
        boolean guessed = false; // флаг, указывающий, угадал ли пользователь число
        while (!guessed) {
            // Выводим строку "угадай число" перед запросом ввода от пользователя
            System.out.println("Guess the number:");
            Scanner scanner = new Scanner(System.in);
            String str = scanner.nextLine() + "\n";
            out.write(str.getBytes());
            String response = in.readLine();
            System.out.println(response);
            // Проверяем ответ от сервера
            if (response.equals("Good")) {
                guessed = true; // устанавливаем флаг, что пользователь угадал число
            }
            if (str.equals("disc\n")) {
                return;
            }
        }
    }
}