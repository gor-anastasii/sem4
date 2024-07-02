import java.io.Console;
import static java.lang.Math. *;
import java.util.Arrays;
import java.util.Objects;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public final int const2 = 2;
    public static final int const3 = 3;

    public static void main(String[] args) {
        // task b

        byte num = 12;
        char letter = 'w';
        int num1 = 123;
        short num2 = 200;
        long num3 = 1000;
        double num4 = 12.3;
        boolean bool = true;
        String str = "Java";

        System.out.println(str + num1);
        System.out.println(str + letter);
        System.out.println(str + num4);

        byte num5 = (byte)(num + num1);
        int num6 = (int)(num3 + num4);
        long num7 = num1 +  2147483647L;

        System.out.println(num5);
        System.out.println(num6);
        System.out.println(num7);

        boolean bool2 = true && false;
        boolean bool3 = true ^ false;

        System.out.println(bool2);
        System.out.println(bool3);

        long number1 = 9223372036854775807L;
        long number2 = 0x7fff_ffff_fffL;

        char l1 = 'a';
        char l2 = '\u0061';
        char l3 = 97;

        System.out.println(l1);
        System.out.println(l2);
        System.out.println(l3);
        System.out.println(l1 + l2 + l3);

        System.out.println(3.45 % 2.4);
        System.out.println(1.0/0.0);
        System.out.println(0.0/0.0);
        System.out.println(Math.log(-345));
        System.out.println(Float.intBitsToFloat(0x7F800000));
        System.out.println( Float.intBitsToFloat(0xFF800000));

        //task c
        final int const1 = 1;

        //task d
        double pi = Math.PI;
        double e = Math.E;

        int roundedPi = (int) Math.round(pi);
        int roundedE = (int) Math.round(e);

        double min = Math.min(pi, e);

        System.out.println("Math.PI: " + pi);
        System.out.println("Math.E: " + e);
        System.out.println("rounded Math.PI: " + roundedPi);
        System.out.println("rounded Math.E: " + roundedE);
        System.out.println("min: " + min);

        double random = Math.random();
        System.out.println("random: " + random);

        //task e

        Boolean bool4 = Boolean.valueOf(true);
        Character l4 = Character.valueOf('A');
        Integer num10 = Integer.valueOf(10);
        Byte num11 = Byte.valueOf((byte)5);
        Short num12 = Short.valueOf((short)100);
        Long num13 = Long.valueOf(100000);
        Double num14 =  Double.valueOf(3.14);

        int sum = num10 + num11;
        double mult = num14 * num12;
        int differ = num12 - num10;

        boolean logic1 = bool4 || (num10 > num12);
        boolean logic2 = bool4 && logic1;

        int bit1 = num2 >> 3;
        int bit2 = num12 << 2;
        int bit3 = ~num11;
        int bit4 = num12 & num2;
        int bit5 = num12 | num2;

        System.out.println("min for long: " + Long.MIN_VALUE);
        System.out.println("max for long: " + Long.MAX_VALUE);
        System.out.println("min for double: " + Double.MIN_VALUE);
        System.out.println("max for double: " + Double.MAX_VALUE);

        int unpackedInteger = num10.intValue();
        byte unpackedByte = num11.byteValue();

        int parsedInt = Integer.parseInt("123");
        String hexString = Integer.toHexString(255);
        int compareResult = Integer.compare(10, 5);
        String intToString = Integer.toString(42);
        int bitCount = Integer.bitCount(255);
        //boolean isNaN = Integer.isNaN();

        // task f

        String s34 = "2345";
        //int intValue1 = new Integer(s34);
        int intValue2 = Integer.valueOf(s34);
        int intValue3 = Integer.parseInt(s34);

        byte[] bytes = s34.getBytes();
        String s34FromBytes = new String(bytes);

        boolean boolValue1 = Boolean.parseBoolean(s34);
        boolean boolValue2 = Boolean.valueOf(s34);

        String str1 = "Hello";
        String str2 = "Hello";
        String str3 = null;

        System.out.println("==: " + (str1 == str2));
        System.out.println("equals: " + str1.equals(str2));
        System.out.println("compareTo: " + str1.compareTo(str2));

        System.out.println("== null: " + (str1 == str3));
        System.out.println("equals null: " + str1.equals(str3));

        String str4 = "Hello, world!";
        String[] splitArray = str.split(", ");
        String replaceResult = str.replace("world", "universe");

        System.out.println("contains: " + str.contains("world"));
        System.out.println("hashCode: " + str.hashCode());
        System.out.println("indexOf: " + str.indexOf("o"));
        System.out.println("length: " + str.length());

        //task g
        char [][] c1;
        char [] c2 [] = {{'a', 'b', 'c'}};
        char c3 [][] = {{'a', 'b', 'c'}};

        c1 = new char[3][];
        int len = 1;

        for (int i = 0; i < c1.length; i++) {
            c1[i] = new char[len];
            len++;
        }

        boolean comRes = c2 == c3;
        c2 = c3;

        for (char[] row : c2) {
            for (char element : row) {
                System.out.print(element + " ");
            }
            System.out.println();
        }

        var wrapper = new WrapperString("Hello, world!") {
            @Override
            public void replace(char oldChar, char newChar) {
                setStr(getStr().replace(oldChar, newChar));
            }

            public void delete(char charToDelete) {
                setStr(getStr().replace(String.valueOf(charToDelete), ""));
            }
        };

        wrapper.replace('o', '0');
        System.out.println(wrapper.getStr());

        wrapper.delete('l');
        System.out.println(wrapper.getStr());


    }
}