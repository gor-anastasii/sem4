import java.net.*;
import java.io.*;

public class Main {
    public static int number;

    public static void main(String[] args) {
        try {
            URL url = new URL("https://unsplash.com/");
            URLConnection connection = url.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                System.out.println(inputLine);
            }
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
