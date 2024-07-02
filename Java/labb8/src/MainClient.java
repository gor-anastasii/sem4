import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;

public class MainClient {
    public static void main(String[] args) throws IOException {
        try( Socket socketClient = new Socket("localhost", 8030);
             BufferedReader in = new BufferedReader(new InputStreamReader(socketClient.getInputStream()));
             OutputStream out = socketClient.getOutputStream();
             Scanner scanner = new Scanner(System.in)) {
            boolean guessed = false;
            while (!guessed) {
                System.out.println("Guess the number:");
                String str = scanner.nextLine();
                out.write((str + "\n").getBytes());
                String response = in.readLine();
                System.out.println(response);

                if (response.equals("Good")) {
                    guessed = true;
                }
                if (str.equals("disc")) {
                    return;
                }
            }
        }
    }
}