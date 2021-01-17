<template>
  <form action="https://postmail.invotes.com/send"
        method="post" id="email_form">
    <div class="container">
      <div style="text-align:center">
        <h3>Contact Us</h3>
        <p style="text-align:center;"> бул. „Джеймс Баучер, 1407 ж.к. Лозенец, София.</p>
        <p style="text-align:center;"> Телефон: 0879333999.</p>
        <p style="text-align:center;"> Еmail: megami_cinema@abv.bg.</p>
      </div>
      <div class="row">
        <div class="column">
          <img src="/pictures/contactsPopCorn.png" width="300" style="width:100%">
        </div>
        <div class="column">
            <input type="text" name="subject" placeholder="Name" />
            <input type="text" name="extra_Email" placeholder="Email"/>
            <textarea name="text" placeholder="Message" style="height:170px"></textarea>
            <input type="hidden" name="access_token" value="m51fqj9j1nebd4xlvya25jfg" />
            <input type="hidden" name="success_url" value=".?message=Email+Successfully+Sent%21&isError=0" />
            <input type="hidden" name="error_url" value=".?message=Email+could+not+be+sent.&isError=1" />
            <input id="submit_form" type="submit" value="Send" />
        </div>
      </div>
    </div>
    </form>
</template>
<script>
export default {
  name: 'Contacs'
}
</script>

<style scoped>
{
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #978CF7;
  color: white;
  padding: 12px 20px;
  border: none;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #978CF7;
}
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 10px;
}
.column {
  float: left;
  width: 50%;
  margin-top: 6px;
  padding: 20px;
}
.row:after {
  content: "";
  display: table;
  clear: both;
}
@media screen and (max-width: 600px) {
  .column, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

</style>
