(function () {
  "use strict";

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll(".edit-form");

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms).forEach(function (form) {
    form.addEventListener(
      "submit",
      function (event) {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }

        form.classList.add("was-validated");
      },
      false
    );
  });
})();

//**************** [ 유효성 검사 ] *****************//
$("#save").click( function() {

  //id 정규식(리터럴)
  var i_RegExp = /^[a-zA-Z0-9]{4,12}$/;
  //비밀번호
  var p_RegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=*]).*$/;
  //전화번호
  var ph_RegExp = /^\d{3}-\d{3,4}-\d{4}$/;
  //이름
  var n_RegExp = /^[가-힣]{2,15}$/;

  //아이디
  var objId = document.getElementById("userid");
  //비밀번호
  var objPwd = document.getElementById("userpw");
  //비밀번호확인
  var objPwd2 = document.getElementById("pwdcheck");
  //전화번호
  var objPhone = document.getElementById("userphone");
  //이름
  var objName = document.getElementById("username");


  // ***************** 이름 유효성검사 ***************** //
  if (objName.value == "") {
    alert("이름을 입력해주세요.");
    return false;
  }
  if (!n_RegExp.test(objName.value)) {
    alert("이름은 특수문자,영어,숫자는 사용할수 없습니다. 한글만 입력하여주세요.");
    return false;
  }

  // ***************** ID 유효성검사 ***************** //
  if (objId.value == "") {
    alert("ID를 입력해주세요.");
    return false;
  }
  if (!i_RegExp.test(objId.value)) {
    //아이디 유효성검사
    alert("ID는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");
    return false;
  }
  
  
  // ***************** PASSWORD 유효성검사 *****************//
  if (objPwd.value == "") {
    // 비밀번호 입력여부 검사
    alert("비밀번호를 입력해주세요.");
    return false;
  }
  if (!p_RegExp.test(objPwd.value)) { //패스워드 유효성검사
    alert("비밀번호는 8~15자의 특수문자,문자,숫자로만 입력해주세요.");
    return false;
  }
  if (objPwd.value == objId.value) { //패스워드와 ID가 동일한지 검사
    alert("비밀번호는 ID와 다르게 입력해주세요.");
    return false;
  }
  if (objPwd2.value != objPwd.value) {//비밀번호와 비밀번호확인이 동일한지 검사
    alert("비밀번호가 틀립니다. 다시 확인하여 입력해주세요.");
    return false;
  }
  
  
  // ***************** 전화번호 유효성검사 ***************** 
 if (ph_RegExp.value == "") { // 전화번호 입력여부 검사
   alert("전화번호를 입력해주세요.");
   return false;
  }
   if (!ph_RegExp.test(objPhone.value)) { //전화번호 유효성 검사
    alert("올바른 전화번호 형식이 아닙니다.");
   return false;
 }
 
 // ***************** 약관 동의 여부 확인 ***************** 
 
 
 if (
  !$("input[name=radio1]").is(":checked") && !$("input[name=radio2]").is(":checked")) {
  alert("약관에 동의하셔야 합니다.");
  console.log("동의 안 함");
  return false;
  
} else if (!$("input[name=radio1]").is(":checked")) {
  alert("약관에 동의하셔야 합니다.");
  console.log("동의 한개 안 함");
  return false;
  
} else if (!$("input[name=radio2]").is(":checked")) {
  alert("약관에 동의하셔야 합니다.");
  console.log("동의 한개 안 함");
  return false;
  
}
 
  // ***************** 아이디 중복체크 여부 확인 ***************** 
  if(!document.getElementById("check").value == "true"){
        alert("아이디 중복체크가 필요합니다.");
        return false;
    }
    
    // 데이터 저장
    alert("회원가입완료!");
  

}); // Validation() 끝