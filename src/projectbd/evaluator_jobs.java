/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projectbd;

import java.sql.*;
import java.text.SimpleDateFormat;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author evans
 */
public class evaluator_jobs extends javax.swing.JFrame {

    private static final String USERNAME = "root";
    private static final String PASSWORD = "local";
    private static final String CONN_STRING = "jdbc:mysql://localhost:3306/staffevaluation";
    String logged;    
    private static final SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
    private static final SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    public evaluator_jobs() {
        initComponents();
    }
    public evaluator_jobs(String logged_user) {
        initComponents();
        logged= logged_user; 
        Connection conn = null;
        try{
            conn = DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
            Statement st=conn.createStatement();
            String show_job = "SELECT * FROM job WHERE edra = (SELECT firm FROM evaluator WHERE evaluatorUsername='"+logged+"') ";
            ResultSet rs = st.executeQuery(show_job);
            
            while (rs.next()){
                String job_start = rs.getString("start_date");
                String job_end = rs.getString("end_date");
                String job_id = rs.getString("id");
                String job_comp = rs.getString("edra");
                String job_title = rs.getString("job_title");
                String job_salary = rs.getString("salary");
                String job_eval = rs.getString("evaluator");
                
                String evaluator_data[] = {job_start,job_end,job_id,job_comp,job_title,job_salary,job_eval  };
                DefaultTableModel tblModel = (DefaultTableModel)evaluator_jobs_table.getModel();
                
                tblModel.addRow(evaluator_data);
            
            }
        
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
            
        }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jButton1 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        evaluator_jobs_table = new javax.swing.JTable();
        jobstarttxt = new javax.swing.JTextField();
        jobendtxt = new javax.swing.JTextField();
        jobidtxt = new javax.swing.JTextField();
        jobcomptxt = new javax.swing.JTextField();
        jobtitletxt = new javax.swing.JTextField();
        jobsalarytxt = new javax.swing.JTextField();
        jButton2 = new javax.swing.JButton();
        jobevaltxt = new javax.swing.JTextField();
        jSeparator1 = new javax.swing.JSeparator();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(0, 102, 102));

        jButton1.setText("back");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        evaluator_jobs_table.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "start date", "end date", "id", "company", "Job title", "Salary", "evaluator"
            }
        ));
        evaluator_jobs_table.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                evaluator_jobs_tableMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(evaluator_jobs_table);

        jobstarttxt.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jobstarttxtActionPerformed(evt);
            }
        });

        jButton2.setText("Update");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel1.setText("UPDATE JOBS");

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel2.setText("start date");

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel3.setText("end date");

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel4.setText("enter id");

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel5.setText("company");

        jLabel6.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel6.setText("job title");

        jLabel7.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel7.setText("salary");

        jLabel8.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel8.setText("evaluator username");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jSeparator1, javax.swing.GroupLayout.Alignment.TRAILING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(148, 148, 148)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 127, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                        .addComponent(jobstarttxt, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jobendtxt, javax.swing.GroupLayout.PREFERRED_SIZE, 94, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jobidtxt, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jobcomptxt, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jobtitletxt, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jobsalarytxt, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 41, Short.MAX_VALUE)
                        .addComponent(jobevaltxt, javax.swing.GroupLayout.PREFERRED_SIZE, 87, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(23, 23, 23))
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 73, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(24, 24, 24)
                                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 98, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(47, 47, 47)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 472, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(61, 61, 61)
                        .addComponent(jLabel3)
                        .addGap(59, 59, 59)
                        .addComponent(jLabel4)
                        .addGap(63, 63, 63)
                        .addComponent(jLabel5)
                        .addGap(55, 55, 55)
                        .addComponent(jLabel6)
                        .addGap(56, 56, 56)
                        .addComponent(jLabel7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 126, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(10, 10, 10))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jButton1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 115, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(35, 35, 35)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jobstarttxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jobendtxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jobidtxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jobcomptxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jobtitletxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jobsalarytxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jobevaltxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(16, 16, 16)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(jLabel3)
                    .addComponent(jLabel4)
                    .addComponent(jLabel5)
                    .addComponent(jLabel6)
                    .addComponent(jLabel7)
                    .addComponent(jLabel8))
                .addGap(62, 62, 62)
                .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel1)
                .addContainerGap(85, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
                    evaluator ev = new evaluator(logged);
                    ev.setVisible(true);
                    this.setVisible(false);
    }//GEN-LAST:event_jButton1ActionPerformed

    private void evaluator_jobs_tableMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_evaluator_jobs_tableMouseClicked
        DefaultTableModel tblModel = (DefaultTableModel)evaluator_jobs_table.getModel();
       
   
        //set data to field when a row selected
        String tblStart = tblModel.getValueAt(evaluator_jobs_table.getSelectedRow(),0).toString();
        String tblEnd = tblModel.getValueAt(evaluator_jobs_table.getSelectedRow(),1).toString();
        String tblID = tblModel.getValueAt(evaluator_jobs_table.getSelectedRow(),2).toString();
        String tblComp = tblModel.getValueAt(evaluator_jobs_table.getSelectedRow(),3).toString();
        String tblTitle= tblModel.getValueAt(evaluator_jobs_table.getSelectedRow(),4).toString();
        String tblSalary = tblModel.getValueAt(evaluator_jobs_table.getSelectedRow(),5).toString();
         String tblEval = tblModel.getValueAt(evaluator_jobs_table.getSelectedRow(),6).toString();
       
        //set txt field
        jobstarttxt.setText(tblStart);
        jobendtxt.setText(tblEnd);
        jobidtxt.setText(tblID);
        jobcomptxt.setText(tblComp);
        jobtitletxt.setText(tblTitle);
        jobsalarytxt.setText(tblSalary);
        jobevaltxt.setText(tblEval);
 
    }//GEN-LAST:event_evaluator_jobs_tableMouseClicked

    private void jobstarttxtActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jobstarttxtActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jobstarttxtActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        String jobeval = jobevaltxt.getText();
       if (jobeval.equals(logged)){
              Connection conn = null; 
              DefaultTableModel tblModel = (DefaultTableModel)evaluator_jobs_table.getModel();
        // if 1 row sleected updated
              if (evaluator_jobs_table.getSelectedRowCount()==1){
        
             
                String jobstart = jobstarttxt.getText();
                String jobend = jobendtxt.getText();
                String jobid = jobidtxt.getText();
                String jobcomp = jobcomptxt.getText();
                String jobtitle = jobtitletxt.getText();
                String jobsalary = jobsalarytxt.getText();
                //update table on java
                tblModel.setValueAt(jobstart,evaluator_jobs_table.getSelectedRow(),0);
                tblModel.setValueAt(jobend,evaluator_jobs_table.getSelectedRow(),1);
                //tblModel.setValueAt(jobid,evaluator_jobs_table.getSelectedRow(),2);
                tblModel.setValueAt(jobcomp,evaluator_jobs_table.getSelectedRow(),3);
                tblModel.setValueAt(jobtitle,evaluator_jobs_table.getSelectedRow(),4);
                tblModel.setValueAt(jobsalary,evaluator_jobs_table.getSelectedRow(),5);
                tblModel.setValueAt(jobeval,evaluator_jobs_table.getSelectedRow(),6);
                //update table on db
                try{
                    conn = DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
                    String update_job = "update job set start_date = '"+jobstart+"', end_date = '"+jobend+"'  ,edra='"+jobcomp+"' ,job_title= '"+jobtitle+"',salary='"+jobsalary+"' WHERE evaluator = '"+logged+"' AND job.id = '"+jobid+"'";
                    PreparedStatement update_job_s = conn.prepareStatement(update_job);
                    update_job_s.execute();
                String update_log = "update log set username = '"+logged+"' WHERE  table_name='job' AND type='update' AND event_date = '"+sdf3.format(timestamp)+"'";
                PreparedStatement updated_log_s = conn.prepareStatement(update_log);
                updated_log_s.execute();
     
                }catch(Exception e){
                JOptionPane.showMessageDialog(null,e);

                }
            }else {
                if (evaluator_jobs_table.getRowCount()==0){
                    // if talbe empty
                    JOptionPane.showMessageDialog(this,"Table is empty");
                }else{
                    //if no selected row or more than 1
                    JOptionPane.showMessageDialog(this,"please select a single row");

               }
            } 

           }else{
                JOptionPane.showMessageDialog(null,"Can't update other's job");
            }           
    }//GEN-LAST:event_jButton2ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(evaluator_jobs.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(evaluator_jobs.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(evaluator_jobs.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(evaluator_jobs.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new evaluator_jobs().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTable evaluator_jobs_table;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JTextField jobcomptxt;
    private javax.swing.JTextField jobendtxt;
    private javax.swing.JTextField jobevaltxt;
    private javax.swing.JTextField jobidtxt;
    private javax.swing.JTextField jobsalarytxt;
    private javax.swing.JTextField jobstarttxt;
    private javax.swing.JTextField jobtitletxt;
    // End of variables declaration//GEN-END:variables
}
