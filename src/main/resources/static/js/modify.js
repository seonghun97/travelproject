function validateForm() {
    if (document.edit_frm.userpw.value.length === 0) {
        alert("비밀번호는 필수 입력사항입니다. 다시 확인해 주세요.");
        return false;
    }
    if (document.edit_frm.username.value.length === 0) {
        alert("이름은 필수 입력사항입니다. 다시 확인해 주세요.");
        return false;
    }
    if (document.edit_frm.userbirth.value.length === 0) {
        alert("생일은 필수 입력사항입니다. 다시 확인해 주세요.");
        return false;
    }
    if (document.edit_frm.userbirth.value.length !== 8) {
        alert("생일은 예시에 맞춰서 적어주세요.");
        return false;
    }
    if (document.edit_frm.useremail.value.length === 0) {
        alert("이메일은 필수 입력사항입니다. 다시 확인해 주세요.");
        return false;
    }
    if (document.edit_frm.usermobile.value.length === 0) {
        alert("전화번호는 필수 입력사항입니다. 다시 확인해 주세요.");
        return false;
    }
    return true;
}
function cancelEdit() {
    window.history.back();
}
