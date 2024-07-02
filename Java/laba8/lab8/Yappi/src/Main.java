import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;

public class Main {
    public static void main(String[] args) throws IOException {
        Task1();
        //Task2();
    }

    private static void Task1() throws MalformedURLException {
        URL metanit = new URL("https://dist.belstu.by/login/index.php");
        try (BufferedReader b = new BufferedReader(
                new InputStreamReader(metanit.openStream())
        ))
        {
            String s;
            s = b.readLine();
            while (s != null) {
                System.out.println(s);
                s = b.readLine();
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        };
    }

    private static void Task2() throws IOException {
        InetAddress inetAddress = InetAddress.getLocalHost();
        DatagramSocket datagramSocket = new DatagramSocket(3333, inetAddress);
        DataSender dataSender = new DataSender(datagramSocket);
        DataGetter dataGetter = new DataGetter(datagramSocket);
        dataSender.send();
        dataGetter.get();
    }
}