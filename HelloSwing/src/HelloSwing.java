import javax.swing.*;
import java.util.concurrent.TimeUnit;

/**
 * Created by kevinliu on 2016/4/2.
 */
public class HelloSwing {
    public static void main(String [] args){
        JFrame frame = new JFrame("Hello Swing");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300,100);
        frame.setVisible(true);

        JLabel l = new JLabel("hello");
        frame.add(l);
        try {
            TimeUnit.SECONDS.sleep(1);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        l.setText("asdadsd");
    }
}
