<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="web_home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="stylesheet" type="text/css" href="assets\lib\bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets\css\style.css">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      
       

    <div class="maindiv">

         <div class="container">
  <div class="jumbotron">
        <h1>ADD EMPLOYEE   </h1><hr>

  <form class="needs-validation" novalidate>
    <div class="form-row">
       <div class="col-md-6 mb-3">
      <label for="validationTooltip01">ID</label>
      <input type="text" class="form-control" runat="server" id="userid"  required>
      <div class="valid-tooltip">
        Looks good!
      </div>
    </div>
        </div>
      <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationTooltip01">First name</label>
      <input type="text" class="form-control" runat="server" id="fnam"  required>
      <div class="valid-tooltip">
        Looks good!
      </div>
    </div>
    <div class="col-md-5 mb-3">
      <label for="validationTooltip02">Last name</label>
      <input type="text" class="form-control" runat="server" id="lnam"  required>
      <div class="valid-tooltip">
        Looks good!
      </div>
    </div>
  </div>
      <div class="form-row">
      <div class="col-md-3 mb-3">
      <label for="validationDefault04">Salary</label>
      <select runat="server" class="custom-select" runat="server" id="salar" required>
        <option  value="10,000">10,000/-</option>
        <option value="15,000">15,000/-</option>
          <option value="18,000">18,000/-</option>
          <option value="20,000">20,000/-</option>
      </select>
    </div>
           <div class="col-md-3 mb-3">
 <label >DOB</label>
 <input type="date"  name="dob"  max="3000-12-31"  min="1000-01-01" class="form-control"  id="dob"  required>
                              
                
              
</div>
</div>
  <div class="form-group">
    <div class="mb-4">
    <label for="validationTextarea">Address</label>
    <textarea class="form-control " runat="server" id="address" placeholder="Address" required></textarea>
    <div class="invalid-feedback">
      Please enter a Address in the textarea.
    </div>
  </div>
   
   
  </div>
  <button class="btn btn-primary" runat="server" id="button_submit" onserverclick="button_submit_ServerClick" type="submit">Upload</button>
</form>
</div>
</div>
        
       <div class="container">
  <div class="jumbotron eps">

 
  <div class="row">
            <div class="col-md-12">
                 <div class="element-wrapper">
        
      <h1 class="element-header">Employee List</h1><hr />
                
        <div class="element-box ">
            <div class="table-responsive">
                <table id="dataTable1" class="table table table-hover table-striped table-info ">
                   <thead>
                                    <tr>
                                        <th> ID</th>
                                        <th>First Name</th>
                                        <th> Last Name</th>                                        
                                        <th>Salary</th>
                                        <th>DOB</th>
                                        <th>Address</th>
                                    </tr>
                                </thead>
                    <tbody>
                         <asp:PlaceHolder ID="ph_EmployeeList" runat="server" />
                    </tbody>
                </table>
            </div>
        </div>
    </div>
            </div>
        </div>


</div>
</div>  

        

        </div>
        

    </form>
	<script type="text/javascript" src="assets\lib\jquery.min.js"></script>
	<script type="text/javascript" src="assets\lib\bootstrap.min.js"></script>
	<script type="text/javascript" src="assets\js\plugin.js"></script>
	<script type="text/javascript" src="assets\js\script.js"></script>

</body>
</html>