//트리거 버튼 처리
document.getElementById("trigger").addEventListener('click', ()=>{
    document.getElementById('files').click();
})
const regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$") //실행파일 막기
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif)$") //이미지 파일만
const maxSize = 1024*1024*20; //파일 최대 사이즈

function fileValidation(fileName,FileSize){
    if(!regExpImg.test(fileName)){
        alert("이미지 파일만 넣어라 좀")
        return 0;
    }else if(regExp.test(fileName)){
        return 0;
    }else if (FileSize>maxSize){
        alert("파일 사이즈가 너무 커")
        return 0;
    }
    else{

        return 1;
    }
}
document.addEventListener('change',(e)=>{
    if(e.target.id == 'files'){
        document.getElementById('btnSave').disabled= false;
        //input file element에 저장된 file의 정보를 가져오는 property
        const fileObj = document.getElementById('files').files;
        console.log("fileObj");

        let div = document.getElementById('fileZone');
        div.innerHTML="";

        //ul=>li로 첨부파일 추가
        // <ul class="list-group list-group-flush">
            /* <li class="list-group-item">An item</li> */
            let isOk =1;
        let ul= ` <ul class="list-group list-group-flush"> `
            for(let file of fileObj){
                let vaildResult = fileValidation(file.name, file.size); // 0 or 1
                console.log(vaildResult);
                isOk *= vaildResult; 
                ul+= `<li class="list-group-item">`;
                ul+=`<div class="mb-3">`;
                ul+=`${vaildResult ? '<div class="mb=3">업로드 가능' : '<div class="mb=3" style="color:red">업로드 불가능</div>'}  `;
                ul+=`${file.name}</div>`;
                ul+=`<span class="badge rounded-pill text-bg-${vaildResult ? 'success' : 'danger'}">${file.size}Bypes</span>`
            }
        div.innerHTML +=ul;

        if(isOk==0){
            document.getElementById('btnSave').disabled= true;
        }
        
    }
})

