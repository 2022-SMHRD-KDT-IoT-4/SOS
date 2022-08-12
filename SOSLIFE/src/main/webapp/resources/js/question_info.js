function GetQuestionList(){
	$.ajax({
      url : 'getquestioninfo.do',
      type : 'get',
      dataType : 'json',
      success : MakeQuestionList, 
      error : function(){alert('error')}
   });
}

function MakeQuestionList(data){
	$('#question_div').html("");
	for(let i=0; i<data.length; i++){
		questionList = data[i];
		console.log(questionList);
		tr = `<div class="num">${questionList.q_seq}</div>
			  <div class="title"><a href="managerquestiondetail.do?q_seq=${questionList.q_seq}">${questionList.q_content}</a></div>
			  <div class="count">${questionList.q_type}</div>
              <div class="writer">${questionList.user_id}</div>
              <div class="date">${questionList.q_date}</div>`;
		$('#question_div').append(tr);
	}
}
