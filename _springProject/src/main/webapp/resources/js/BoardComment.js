console.log(bnoVal);
document.getElementById('cmtPostBtn').addEventListener('click',()=>{
    const contentVal= document.getElementById("cmtText").value;
    const  writerVal = document.getElementById("cmtWriter").innerText;
    console.log(writerVal);
    if(contentVal == null || contentVal ==""){
        alert("댓글을 입력해주세요")
        return false;
    }
    else{
     let cmtData={
          bno : bnoVal,
          writer : writerVal,
         content : contentVal
     }
     console.log(cmtData);
     postCmt(cmtData).then(result=>{
         console.log(result)
         if(result>0){
             alert("댓글 등록 성공");
             spreadCmtList(bnoVal);
         }else{
             alert("댓글 등록 실패");
         }
     })
    }
})



async function postCmt(cmtData) {

    try {
        const url ="/comment/post"
        const config = {
            method :"post",
            headers :{ "content-type" : "application/json; charset=utf-8"},
            body : JSON.stringify(cmtData)
        
     };

        const resp = await fetch(url, config);
        return result = resp.text();
    } catch (error) {
        
    }
}
async function getCmtList(bnoVal,page){
    try{
        const resp = await fetch('/comment/'+bnoVal+'/'+page);
        const result = await resp.json();
        console.log(result);
        return result;
    }catch(err){
        console.log(err);
    }
}
function spreadCmtList(bnoVal,page =1){
    getCmtList(bnoVal,page).then(result=>{
        console.log(result) //ph
       
     
        let ul =document.getElementById('cmtListArea');
        if(page==0){

            ul.innerHTML="";
        }
        if(result.cmtList.length > 0 ){
            ul.innerHTML="";
            for(let cvo of result.cmtList){
                let li =` <li class="list-group-item" data-cno="${cvo.cno}" data-writer=${cvo.writer}>`
                li +=`     <div class="mb-3">`
				li +=` 	<div class="fw-bold">${cvo.writer}</div>`
				li +=` 	${cvo.content}`
				li +=` </div>`
                if(email==cvo.writer){
                li +=`<input type="text" id="modText${cvo.cno}"><br><br>`

                li +=`	<button type="button" class="btn btn-primary mod" data-bs-toggle="modal" data-bs-target="#myModal"> 수정</button>`
                li +=`   <button type="button" class="btn btn-primary delBtn"`
                li +=` style="-bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;"> 삭제</button> <br>`
                }

				li +=` <span class="badge rounded-pill text-bg-secondary">${cvo.regAt}</span>`
		        li +=` 	</li>`;
                ul.innerHTML += li;
            }

            //댓글 페이징 코드
            let moreBtn = document.getElementById('moreBtn');
            //db에서 pgvo+list 같이 가져와야 값을 줄 수 있음.
            if(result.pgvo.pageNo<result.endPage || result.next){
                moreBtn.style.visibility="visible";
                moreBtn.dataset.page = page+1;

            }else{
                moreBtn.style.visibility="hidden";
            }

        }else{
            let li = `<li>Comment List Empty</li>`;
            ul.innerHTML = li;
        } 
    })
}
document.addEventListener('click', (e)=>{
    console.log(e.target.id);
     if(e.target.classList.contains('delBtn')){
     
        let li = e.target.closest('li');
        let cnoVal = li.dataset.cno;
        let writerVal = li.dataset.writer;
        console.log(cnoVal);
        deleteCmt(cnoVal).then(result =>{
            if(result>0){
                alert("댓글 삭제 성공")
                spreadCmtList(bnoVal);
            }else if(result>0){
                alert("댓글 삭제 실패 ")
            }
            spreadCmtList(bnoVal);

        })  
    } else if (e.target.classList.contains('mod')){
   
        let li = e.target.closest('li');
        let cnoval = li.dataset.cno;            
                console.log(cnoval);
                let text = document.getElementById(`modText${cnoval}`).value;
                console.log(text);
                let cmtDataMod ={
                    cno : cnoval,
                    content: text
                };
                editCommentToSever(cmtDataMod).then(result =>{
                    console.log(result);
                    if(result>0){
                        alert("댓글 수정 성공")
                        spreadCmtList(bnoVal);
                    }
                })


    }else if(e.target.id == 'moreBtn'){

        spreadCmtList(bnoVal,parseInt(e.target.dataset.page));
    }
})

async function deleteCmt(cno,writer,bno){
    try {
        const url ='/comment/del/'+cno;
        const config = {
            method : "delete"
          
        };
        const resp = await fetch(url,config);
        const result = await resp.text();
        return result;        
    } catch (error) {
        console.log(error);
    }
}

async function editCommentToSever(cmtDataMod){
    try {
        const url = '/comment/'+cmtDataMod.cno;
        const config ={
            method: 'put',
            headers: {
                'content-Type' : 'application/json; charset=utf-8'
            },
            body : JSON.stringify(cmtDataMod)

        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}