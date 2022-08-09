$(document).ready(function(){
	GetNoticeList()
});

function GetNoticeList(){
	$.ajax({
      url : 'noticelist.do',
      type : 'get',
      dataType : 'json',
      success : MakeNoticeList, 
      error : function(){alert('error')}
   });
}

function MakeNoticeList(data){
	$('#notice_div').html("");
	for(let i=0; i<data.length; i++){
		noticeList = data[i];
		tr = `<div class="num">${noticeList.notice_seq}</div>
			  <div class="title"><a href="managerNoticeView.do?notice_seq=${noticeList.notice_seq}">${noticeList.notice_subject}</a></div>
              <div class="writer">${noticeList.notice_id}</div>
              <div class="date">${noticeList.notice_date}</div>
              <div class="count">${noticeList.notice_count}</div>
		`;
		$('#notice_div').append(tr);
	}
}
                       