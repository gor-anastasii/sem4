import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Client implements Runnable {
    private Socket clientSocket;
    private int numberToGuess;

    public Client(Socket socket, int numberToGuess) {
        this.clientSocket = socket;
        this.numberToGuess = numberToGuess;
    }

    @Override
    public void run() {
        try {
            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);

            out.println("Welcome to game! Enter the number from 1 to 100: ");

            int guess;
            do {
                String input = in.readLine();
                guess = Integer.parseInt(input);

                if (guess < numberToGuess) {
                    out.println("You number is less");
                } else if (guess > numberToGuess) {
                    out.println("You number is bigger");
                } else {
                    out.println("Congratulation! You guess the number!");
                }
            } while (guess != numberToGuess);

            clientSocket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}