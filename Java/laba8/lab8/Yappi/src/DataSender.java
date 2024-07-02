import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

public class DataSender {
    private final DatagramSocket socket;
    public DataSender(DatagramSocket datagramSocket) throws SocketException {
        socket = datagramSocket;
    }
    public void send() throws IOException {
        DatagramPacket datagramPacket = new DatagramPacket("привет\n".getBytes(), "привет\n".getBytes().length);
        datagramPacket.setAddress(InetAddress.getLocalHost());
        datagramPacket.setPort(3333);
        socket.send(datagramPacket);
    }
}
