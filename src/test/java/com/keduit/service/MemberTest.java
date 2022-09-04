package com.keduit.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
                  "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberTest {
   
   @Setter(onMethod_=@Autowired)
   private PasswordEncoder pwencoder;
   
   @Setter(onMethod_=@Autowired)
   private DataSource ds;
   
   @Test
   public void testInsertMember() {
      
      String sql="insert into Member_TB (userid,userpw,username,userphone) values(?,?,?,?)";
      
      
      for(int i=1; i<=10; i++) {
         Connection conn=null;
         PreparedStatement pstmt=null;
         
         try {
            conn=ds.getConnection();
            pstmt=conn.prepareStatement(sql);
            
            
            pstmt.setString(1,"user"+i);
            pstmt.setString(2,pwencoder.encode("pw"+i));
            pstmt.setString(3,"일반사용자"+i);
            pstmt.setString(4,""+i);
            
            pstmt.executeUpdate();
            
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            if(pstmt!=null) {try {pstmt.close();} catch (Exception e) {}}
            
            if(conn!=null) {try {conn.close();} catch (Exception e){}}
         }
         
      }
   }
   
   
   
   
}