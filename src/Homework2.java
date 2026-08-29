/*
Lucas Walker
Mr. Menezes
AT CS
8/29/26
*/

public class Homework2 {
    public static void main(String[]args) {
        int a = 5;
        int b = 2;
        System.out.println(computeDivision(a,b));
    }
    public static int computeQuotient(int dividend, int divisor) {
        int answer = dividend/divisor;
        return answer;
    }
    public static int computeRemainder(int dividend, int divisor) {
        int answer = dividend%divisor;
        return answer;
    }
    public static double computeDecimal(int dividend, int divisor) {
        double answer = (double) dividend/divisor;
        return answer;
    }
    public static String computeDivision(int dividend, int divisor) {
        int a = dividend;
        int b = divisor;
        int c = dividend/divisor;
        int d = dividend%divisor;
        double e = (double) dividend/divisor;
        String answer = a + " divided by " + b + " is equal to " + c + " remainder " + d + " or " + e;
        return answer;
    }
}
