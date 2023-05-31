/**
 * 
 */

 function joinCheck() {
		 
	 if(document.join_frm.userid.value.length == 0) {
		 alert("아이디는 필수 입력사항입니다. 다시 확인해 주세요.");
		 return;
	 }
	 
	  if(document.join_frm.userpw.value.length == 0) {
		 alert("비밀번호는 필수 입력사항입니다. 다시 확인해 주세요.");
		 return;
	 }
	  if(document.join_frm.userpw_check.value.length == 0) {
		 alert("비밀번호체크는 필수 입력사항입니다. 다시 확인해 주세요.");
		 return;
	 }
	  if(document.join_frm.userpw.value != document.join_frm.userpw_check.value) {
		 alert("비밀번호와 비밀번호 체크가 일치하지 않습니다. 다시 확인해 주세요.");
		 return;
	 }
	  if(document.join_frm.username.value.length == 0) {
		 alert("이름 필수 입력사항입니다. 다시 확인해 주세요.");
		 return;
	 }
	  if(document.join_frm.userbirth.value.length == 0) {
		 alert("생일은 필수 입력사항입니다. 다시 확인해 주세요.");
		 return;
	 }
	  if(document.join_frm.useremail.value.length == 0) {
		 alert("이메일은 필수 입력사항입니다. 다시 확인해 주세요.");
		 return;
	 }
	   if(document.join_frm.usermobile.value.length == 0) {
		 alert("전화번호 느 필수 입력사항입니다. 다시 확인해 주세요.");
		 return;
	 }
	 document.join_frm.submit();
 }