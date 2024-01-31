package wk02.wed;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;

public class IteratorCode {
    public static void main(String[] args) {
        ArrayList<Integer> al1 = new ArrayList<>();
        int i1 = 7;
        al1.add(i1);
        int i2 = al1.get(0);
        System.out.println(i2);

        Random rand = new Random(0);
        for(int i = 0; i < 20; i++) {
            al1.add(rand.nextInt(50));
        }

        // traditional for loop
        for(int i = 0; i < al1.size(); i++) {
            System.out.print(al1.get(i) + " ");
        }
        System.out.println();

        // enhanced for loop
        for(int i : al1) {
            System.out.print(i + " ");
        }
        System.out.println();

        Iterator iter = al1.iterator();
        while(iter.hasNext()) {
            int x = (int) iter.next();
            System.out.print(x + " ");
        }

        System.out.println();
    }
}
