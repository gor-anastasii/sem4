import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

public class DataGetter {
    private final DatagramSocket socket;
    public DataGetter(DatagramSocket datagramSocket) throws SocketException {
        socket = datagramSocket;
    }
    public void get() throws IOException {
        byte[] buffer = new byte[32];
        DatagramPacket datagramPacket = new DatagramPacket(buffer, 32);
        socket.receive(datagramPacket);
        System.out.println(new String(datagramPacket.getData()));
    }
}
