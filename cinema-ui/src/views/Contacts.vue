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
            <!-- return urls can be fully qualified -OR-
               start with / for root relative -OR-
               start with . for url relative -->
            <input type="hidden" name="success_url" value=".?message=Email+Successfully+Sent%21&isError=0" />
            <input type="hidden" name="error_url" value=".?message=Email+could+not+be+sent.&isError=1" />
            <!-- set the reply-to address -->
            <!-- <input type="text" name="reply_to"
                        placeholder="Your Email" /> -->

            <!-- to append extra fields, use the extra_ prefix.
                Entries will be appended to your message body. -->
            <!-- <input type="text" name="extra_phone_number"
                        placeholder="Phone Number" /> -->

            <!-- to split your message into 160 chars
                 for an sms gateway -->
            <!-- <input type="hidden"
                        name="sms_format" value="true" /> -->

            <input id="submit_form" type="submit" value="Send" />
            <!-- not required, but we'd appreciate it if you'd link to us somewhere on your site -->
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

/* Style inputs */
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
/* Style the container/contact section */
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 10px;
}
/* Create two columns that float next to eachother */
.column {
  float: left;
  width: 50%;
  margin-top: 6px;
  padding: 20px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

</style>
