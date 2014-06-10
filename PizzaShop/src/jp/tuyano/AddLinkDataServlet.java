package jp.tuyano;
 
import java.io.IOException;
import java.net.URL;
import java.util.*;

import javax.jdo.*;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.apphosting.utils.config.ClientDeployYamlMaker.Request;
 
public class AddLinkDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/plain");
        resp.getWriter().println("no url...");
    }
 
    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
    	UserService us = UserServiceFactory.getUserService();
    	User user = us.getCurrentUser();
        req.setCharacterEncoding("UTF-8");
        String title = req.getParameter("title");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String mail = user.getEmail();
        String comment = req.getParameter("comment");
        Date date = Calendar.getInstance().getTime();
        LinkData data = new LinkData(title,address,phone,mail,comment,date);
        PersistenceManagerFactory factory = PMF.get();
        PersistenceManager manager = factory.getPersistenceManager();
        try {
            manager.makePersistent(data);
        } finally {
            manager.close();
        }
        
        resp.setContentType("text/plain");
        
        Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);
 
        try {
            Message msg = new MimeMessage(session);
            //発信元情報：メールアドレス、名前
            msg.setFrom(new InternetAddress("g12957tm@gm.tsuda.ac.jp", "PizzaShop"));
 
            //送信先情報
            msg.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(mail, mail));
 
            //タイトルと本文
            ((MimeMessage)msg).setSubject("Thank You!");
            msg.setText("ご注文内容---"+comment);
            Transport.send(msg);
 
        } catch (AddressException e) {
            //アドレス不明時
        } catch (MessagingException e) {
            //接続失敗時の処理
        }
        resp.sendRedirect("/history.html");
    }
}