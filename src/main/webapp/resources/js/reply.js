console.log("reply -------!!");
var replyService = (function(){

	//댓글 등록
	function companyVal_Add(reply, callback){
		console.log("replyService add ---------");
		
		$.ajax({
			type:'post',
			url: '/replies/CompanyVal/creat',
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function interviewAns_Add(reply, callback){
		console.log("replyService add ---------");
		
		$.ajax({
			type:'post',
			url: '/replies/InterviewAns/creat',
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function passlatter_Add(reply, callback){
		console.log("replyService add ---------");
		
		$.ajax({
			type:'post',
			url: '/replies/Passlatter/creat',
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function passSelfIntroduct_Add(reply, callback){
		console.log("replyService add ---------");
		
		$.ajax({
			type:'post',
			url: '/replies/PassSelfIntroduct/creat',
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function worryQnA_Add(reply, callback){
		console.log("replyService add ---------");
		
		$.ajax({
			type:'post',
			url: '/replies/WorryQnA/creat',
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	//댓글 리스트 뿌리기
	function companyVal_GetList(param, callback, error){
		var bno = param.bno;
		var page = (param.page == -1? 1 : param.page);
		
		console.log("getList bno, page-------"+bno+","+page);
		
		$.getJSON("/replies/CompanyVal/pages/"+bno+"/"+page+".json",
			function(data){
				if(callback){
					callback(data.replyCnt, data.list);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error(err);
				}
		});
	}
	
	function interviewAns_GetList(param, callback, error){
		var bno = param.bno;
		var page = (param.page == -1? 1 : param.page);
		
		console.log("getList bno, page-------"+bno+","+page);
		
		$.getJSON("/replies/InterviewAns/pages/"+bno+"/"+page+".json",
			function(data){
				if(callback){
					callback(data.replyCnt, data.list);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error(err);
				}
		});
	}
	
	function passlatter_GetList(param, callback, error){
		var bno = param.bno;
		var page = (param.page == -1? 1 : param.page);
		
		console.log("getList bno, page-------"+bno+","+page);
		
		$.getJSON("/replies/Passlatter/pages/"+bno+"/"+page+".json",
			function(data){
				if(callback){
					callback(data.replyCnt, data.list);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error(err);
				}
		});
	}
	
	function passSelfIntroduct_GetList(param, callback, error){
		var bno = param.bno;
		var page = (param.page == -1? 1 : param.page);
		
		console.log("getList bno, page-------"+bno+","+page);
		
		$.getJSON("/replies/PassSelfIntroduct/pages/"+bno+"/"+page+".json",
			function(data){
				if(callback){
					callback(data.replyCnt, data.list);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error(err);
				}
		});
	}
	
	function worryQnA_GetList(param, callback, error){
		var bno = param.bno;
		var page = (param.page == -1? 1 : param.page);
		
		console.log("getList bno, page-------"+bno+","+page);
		
		$.getJSON("/replies/WorryQnA/pages/"+bno+"/"+page+".json",
			function(data){
				if(callback){
					callback(data.replyCnt, data.list);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error(err);
				}
		});
	}
	
	//댓글 1건 읽어오기
	//"/replies/"+rno+".json" 으로 1건을 읽어온다.
	function companyVal_Get(rno, callback, error){
		$.get("/replies/CompanyVal/"+rno+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, error){
			if(error){
				error(error);
			}
		});
	}
	
	function interviewAns_Get(rno, callback, error){
		$.get("/replies/InterviewAns/"+rno+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, error){
			if(error){
				error(error);
			}
		});
	}
	
	function passlatter_Get(rno, callback, error){
		$.get("/replies/Passlatter/"+rno+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, error){
			if(error){
				error(error);
			}
		});
	}
	
	function passSelfIntroduct_Get(rno, callback, error){
		$.get("/replies/PassSelfIntroduct/"+rno+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, error){
			if(error){
				error(error);
			}
		});
	}
	
	function worryQnA_Get(rno, callback, error){
		$.get("/replies/WorryQnA/"+rno+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, error){
			if(error){
				error(error);
			}
		});
	}
	
	//댓글 1건 삭제
	function companyVal_Remove(rno, callback, error){
		console.log("remove rno-------"+rno);
	
		$.ajax({
			type: 'delete',
			url: '/replies/CompanyVal/'+rno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}	
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function interviewAns_Remove(rno, callback, error){
		console.log("remove rno-------"+rno);
	
		$.ajax({
			type: 'delete',
			url: '/replies/InterviewAns/'+rno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}	
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function passlatter_Remove(rno, callback, error){
		console.log("remove rno-------"+rno);
	
		$.ajax({
			type: 'delete',
			url: '/replies/Passlatter/'+rno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}	
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function passSelfIntroduct_Remove(rno, callback, error){
		console.log("remove rno-------"+rno);
	
		$.ajax({
			type: 'delete',
			url: '/replies/PassSelfIntroduct/'+rno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}	
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function worryQnA_Remove(rno, callback, error){
		console.log("remove rno-------"+rno);
	
		$.ajax({
			type: 'delete',
			url: '/replies/WorryQnA/'+rno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}	
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	//댓글 1건 수정
	function companyVal_Update(reply, callback, error){
		console.log("update rno-------"+reply.rno);
		
		$.ajax({
			type: 'put',
			url: '/replies/CompanyVal/'+reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	function interviewAns_Update(reply, callback, error){
		console.log("update rno-------"+reply.rno);
		
		$.ajax({
			type: 'put',
			url: '/replies/InterviewAns/'+reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	function passlatter_Update(reply, callback, error){
		console.log("update rno-------"+reply.rno);
		
		$.ajax({
			type: 'put',
			url: '/replies/Passlatter/'+reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	function passSelfIntroduct_Update(reply, callback, error){
		console.log("update rno-------"+reply.rno);
		
		$.ajax({
			type: 'put',
			url: '/replies/PassSelfIntroduct/'+reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	function worryQnA_Update(reply, callback, error){
		console.log("update rno-------"+reply.rno);
		
		$.ajax({
			type: 'put',
			url: '/replies/WorryQnA/'+reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function displayTime(timeValue){
		
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		
		console.log("displayTime!!"+timeValue);
		
		//시간 차이가 24시간 미만이라면,
		if(gap < (1000 * 60 * 60 * 24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [(hh>9?'':'0')+hh, ':', (mi>9?'':'0')+mi,':', (ss>9?'':'0')+ss].join('');
			//배열요소를 문자열로 변환 .join
			//시간에 포맷을 맞추기 위해서
			//0~9까지는 앞에 0을 추가 표시
		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1;
			var dd = dateObj.getDate();
			
			return [yy, '/', (mm>9?'':'0')+mm, '/', (dd>9?'':'0')+dd].join('');
		}
	}
	
	return{companyVal_Add:companyVal_Add,
	       interviewAns_Add:interviewAns_Add,
	       passlatter_Add:passlatter_Add,
	       passSelfIntroduct_Add:passSelfIntroduct_Add,
	       worryQnA_Add:worryQnA_Add,
		   companyVal_Get:companyVal_Get,
		   interviewAns_Get:interviewAns_Get,
		   passlatter_Get:passlatter_Get,
		   passSelfIntroduct_Get:passSelfIntroduct_Get,
		   worryQnA_Get:worryQnA_Get,
		   companyVal_GetList:companyVal_GetList,
		   interviewAns_GetList:interviewAns_GetList,
		   passlatter_GetList:passlatter_GetList,
		   passSelfIntroduct_GetList:passSelfIntroduct_GetList,
		   worryQnA_GetList:worryQnA_GetList,
		   companyVal_Remove:companyVal_Remove,
		   interviewAns_Remove:interviewAns_Remove,
		   passlatter_Remove:passlatter_Remove,
		   passSelfIntroduct_Remove:passSelfIntroduct_Remove,
		   worryQnA_Remove:worryQnA_Remove,
		   companyVal_Update:companyVal_Update,
		   interviewAns_Update:interviewAns_Update,
		   passlatter_Update:passlatter_Update,
		   passSelfIntroduct_Update:passSelfIntroduct_Update,
		   worryQnA_Update:worryQnA_Update,
		   displayTime:displayTime
		   };
})();