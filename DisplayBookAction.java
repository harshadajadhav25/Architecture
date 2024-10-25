package mvc_filter;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;

public class DisplayBookAction extends ActionSupport {
    private Connection connection;
    private PreparedStatement getRecords;
    private List<BookBean> bookList = new ArrayList<>();

    @Override
    public String execute() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bookdb";
            connection = DriverManager.getConnection(url, "root", "123456");

            getRecords = connection.prepareStatement("SELECT bookname, price FROM books");

            ResultSet results = getRecords.executeQuery();
            while (results.next()) {
                BookBean book = new BookBean();
                book.setBookname(results.getString("bookname"));
                book.setPrice(results.getInt("price"));
                bookList.add(book);
            }

            getRecords.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    public List<BookBean> getBookList() {
        return bookList;
    }

    public void setBookList(List<BookBean> bookList) {
        this.bookList = bookList;
    }
}