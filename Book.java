// package mvc_filter;

// public class BookBean {
//     private String bookname;
//     private int price;

//     // Getters and setters
//     public String getBookname() {
//         return bookname;
//     }

//     public void setBookname(String bookname) {
//         this.bookname = bookname;
//     }

//     public int getPrice() {
//         return price;
//     }

//     public void setPrice(int price) {
//         this.price = price;
//     }
// }

package mvc_filter;

public class Book {
    private String bookname;
    private double price; // Change to double to match your initial prices

    // Constructor
    public Book(String bookname, double price) {
        this.bookname = bookname;
        this.price = price;
    }

    // Getters and Setters
    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
