using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class web_home : System.Web.UI.Page
{
    //public string connetionstring = @"data source=johnmcclain-pc;initial catalog=employees;integrated security=true";

    public string connetionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\employee.mdf;Integrated Security=True";
    SqlConnection cnn;
    protected void Page_Load(object sender, EventArgs e)
    {

        LoadGrid();
       
    }

    private void LoadGrid()
    {
        String sql = "";
        
        SqlCommand command;
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataSet ds = new DataSet();
        
        cnn = new SqlConnection(connetionString);
        sql = "select *,format(dob,'MM/dd/yyyy') as Date from employee";
        cnn.Open();
        command = new SqlCommand(sql, cnn);
        adapter.SelectCommand = command;
        adapter.Fill(ds);
        adapter.Dispose();
        command.Dispose();    
        cnn.Close();
      
        string divTemplate = "<tr><td>%%ID%%</td>"
                              + "<td>%%firstname%%</td>"
                              + "<td>%%lastName%%</td>"
                              + "<td>%%salary%%</td>"
                               + "<td>%%dob%%</td>"
                                + "<td>%%Address%%</td>"
                              + "</tr> ";
        string childHtml = "", html = "";
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            childHtml = divTemplate;
            childHtml = childHtml.Replace("%%ID%%", Convert.ToString(dr["ID"]));
            childHtml = childHtml.Replace("%%firstname%%", Convert.ToString(dr["firstname"]));
            childHtml = childHtml.Replace("%%lastName%%", Convert.ToString(dr["lastName"]));
            childHtml = childHtml.Replace("%%salary%%", Convert.ToString(dr["salary"]));
            childHtml = childHtml.Replace("%%dob%%", Convert.ToString(dr["Date"]));
            childHtml = childHtml.Replace("%%Address%%", Convert.ToString(dr["Address"])); 
 
            html += childHtml;
        }
        ph_EmployeeList.Controls.Add(new LiteralControl(html));      
                
    }

    protected void button_submit_ServerClick(object sender, EventArgs e)
    {
              
      

        
        cnn = new SqlConnection(connetionString);

        cnn.Open();
        
		SqlCommand command;
		SqlDataAdapter adapter = new SqlDataAdapter(); 
		String sql="";

        sql = "Insert into employee (ID,firstname,lastName,salary,dob,Address) values(@ID,@firstname,@lastName,@salary,@dob,@Address)";
		
		command = new SqlCommand(sql,cnn);
        command.Parameters.AddWithValue("@ID",userid.Value);
        command.Parameters.AddWithValue("@firstname",fnam.Value);
        command.Parameters.AddWithValue("@lastName", fnam.Value);
        command.Parameters.AddWithValue("@salary", salar.Value);
        command.Parameters.AddWithValue("@dob", Request.Form["dob"]);
        command.Parameters.AddWithValue("@Address", address.Value);
        command.ExecuteNonQuery();
        command.Dispose(); 
             
        cnn.Close();      


        Response.Redirect("home.aspx",false);
        

    }
}